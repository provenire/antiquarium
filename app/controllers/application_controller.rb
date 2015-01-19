class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Require authenticated user session
  before_filter :require_login


  private

  # Redirect if no session
  def not_authenticated
    redirect_to new_users_session_path
  end

end
