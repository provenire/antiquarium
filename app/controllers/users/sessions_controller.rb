class Users::SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  layout 'login'

  def new
  end

  def create
    if @user = login(email_param, password_param, remember_param)
      redirect_back_or_to(:users, notice: 'Login successful.')
    else
      flash.now[:error] = 'Your email address or password is incorrect.'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'You have successfully logged out.')
  end

  private

  def email_param
    params.require(:email)
  end

  def password_param
    params.require(:password)
  end

  def remember_param
    params.permit(:remember)
  end

end
