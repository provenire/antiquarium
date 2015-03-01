module Errors
  extend ActiveSupport::Concern

  included do
    
    # global handler for simple not found case
    rescue_from ActiveRecord::RecordNotFound do |e|
      error_response(message: e.message, status: 404)
    end

    # Unauthorized
    rescue_from WineBouncer::Errors::OAuthUnauthorizedError do |e|
      error_response(message: e.message, status: 401)
    end

    rescue_from WineBouncer::Errors::OAuthForbiddenError do |e|
      error_response(message: e.message, status: 403)
    end

    # global exception handler, used for error notifications
    rescue_from :all do |e|
      if Rails.env.development?
        raise e
      else
        Raven.capture_exception(e)
        error_response(message: 'Internal server error', status: 500)
      end
    end
  end
end
