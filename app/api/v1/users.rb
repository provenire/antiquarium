module V1
  class Users < Grape::API
    resource :users do

      # Helpers
      helpers do
        def ensure_user!
          error!(status: 401) unless current_user == User.find(permitted_params[:id])
        end

        params :ident do
          requires :id, type: String, desc: 'User ID or Slug'
        end

        params :mutable do
          optional :name,        type: String
          optional :description, type: String
          optional :company,     type: String
          optional :location,    type: String
        end
      end


      # Me
      desc 'Current user'
      get 'me' do
        current_user
      end


      # Show
      desc 'Get a user profile'
      params { includes :ident }
      get ':id' do
        User.find(permitted_params[:id])
      end


      # Update
      desc 'Update a user account'
      params { includes :ident, :mutable }
      put ':id' do
        ensure_user!
        resource = User.find(permitted_params[:id])
        resource.update!(mutable_params)
        resource
      end

    end
  end
end
