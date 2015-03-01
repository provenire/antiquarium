module Defaults
  extend ActiveSupport::Concern

  included do
    # Formatting
    format                  :json
    default_format          :json
    formatter               :json, Grape::Formatter::ActiveModelSerializers
    default_error_formatter :json


    # Helpers
    helpers do
      def permitted_params
        @permitted_params ||= declared(params, include_missing: false)
      end
    end

  end
end