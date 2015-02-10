class ErrorsController < ActionController::Base
  skip_before_filter :require_login
  layout             'error'

  def not_found
    render status: :not_found
  end

  def unprocessable_entity
    render status: :unprocessable_entity
  end

  def server_error
    render status: :server_error
  end
end
