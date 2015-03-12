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

      def set_papertrail_user!
        set_papertrail_user current_user.id
      end
    end
  end
end
