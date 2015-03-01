module V1
  class Base < Grape::API
    version 'v1', using: :header, vendor: 'antiquarium'

    # Modules
    include API::Defaults
    include API::Authentication
    include API::Errors


    # Endpoints
    mount V1::Users
    mount V1::Artifacts
    mount V1::People
    mount V1::Places
    mount V1::Sources
    mount V1::Events
    mount V1::Affiliations


    # Root
    desc 'Root'
    get '/' do
      content_type 'text/plain'
      body         'Antiquarium API'
    end


    # 404
    route :any, '*path' do
      error! 'Endpoint not found', 404
    end
  end
end
