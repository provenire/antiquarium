class Users::ResetPasswordController < ApplicationController
  skip_before_filter :require_login
  layout 'register'

  # Generate token & send reset instructions
  def create
    @user = User.find_by_email(email_param)
    @user.deliver_reset_password_instructions! if @user

    redirect_to(root_path, :notice => 'Instructions have been sent to your email.')
  end

  # Render the reset form
  def edit
    @token = token_param
    @user = User.load_from_reset_password_token(token_param)

    if @user.blank?
      not_authenticated
      return
    end
  end

  # Reset password
  def update
    @token = token_param
    @user = User.load_from_reset_password_token(token_param)

    if @user.blank?
      not_authenticated
      return
    end

    # the next line makes the password confirmation validation work
    @user.password_confirmation = password_params[:password_confirmation]
    # the next line clears the temporary token and updates the password
    if @user.change_password!(password_params[:password])
      redirect_to(root_path, :notice => 'Password was successfully updated.')
    else
      flash.now[:error] = 'Error registering.'
      render :action => "edit"
    end
  end


  private

  def email_param
    params.require(:email)
  end

  def token_param
    params.require(:token)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
