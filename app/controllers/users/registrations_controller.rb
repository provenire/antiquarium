class Users::RegistrationsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  layout 'register'

  # Using activation token?
  before_action :ensure_token


  # Register account if using activation token
  def new
    if @user = User.load_from_activation_token(token_param)
      @token = token_param
    else
      not_authenticated
    end
  end


  # Update account with info and activate
  def create
    @token = token_param
    if @user = User.load_from_activation_token(token_param)
      if @user.update_attributes(user_params)
        @user.activate!
        redirect_to new_users_session_path, :notice => 'Your account is now activated.'
      else
        flash.now[:error] = 'Error registering.'
        render :new
      end
    else
      not_authenticated
    end
  end


  private

  # Params
  def token_param
    params.require(:token)
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

  # Make sure token exists in requests
  def ensure_token
    not_authenticated if params[:token].nil?
  end

end
