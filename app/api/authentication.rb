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
        ::PaperTrail.controller_info = {
          ip_address: env['action_dispatch.remote_ip'].to_s,
          user_agent: env['HTTP_USER_AGENT']
        }
      end
    end
  end
end
