module Authentication
  extend ActiveSupport::Concern

  included do
    use ::WineBouncer::OAuth2

    helpers do
      def current_token
        doorkeeper_access_token
      end

      def current_user
        resource_owner
      end

      def current_scopes
        current_token.scopes
      end
    end
  end
end
