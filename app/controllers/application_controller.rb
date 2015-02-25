class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null_session

  # Require authenticated user session
  #before_filter :require_login,         :if     => lambda { request.format.html? }
  before_filter :doorkeeper_authorize!

  # Set user cookie if authenticated
  #before_filter :set_user_cookie

  def current_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  private

  def set_user_cookie
    if logged_in? && cookies[:_antiquarium_id] != current_user.id
      cookies[:_antiquarium_id] = current_user.id
    end
  end

  # Redirect if no session
  def not_authenticated
    redirect_to new_users_session_path
  end



end
