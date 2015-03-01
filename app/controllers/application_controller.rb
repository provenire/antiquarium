class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session


  # Require authenticated user session
  # before_filter :doorkeeper_authorize!


  # Fetch current user for doorkeeper
  # def current_user
  #   User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  # end
end
