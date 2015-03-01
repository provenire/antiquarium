module V1
  class Users < Grape::API
    resource :users do

      # Helpers
      helpers do
        def ensure_user!
          error!(status: 401) unless current_user == User.find(permitted_params[:id])
        end
      end


      # Me
      desc 'Current user'
      get 'me' do
        current_user
      end


      # Show
      desc 'Get a user profile'
      params do
        requires :id, type: String, desc: 'User ID or Slug'
      end
      get ':id' do
        User.find(permitted_params[:id])
      end


      # Update
      desc 'Update a user account'
      params do
        requires :id,          type: String
        optional :name,        type: String
        optional :description, type: String
        optional :company,     type: String
        optional :location,    type: String
      end
      put ':id' do
        ensure_user!
        current_user.update({
          name:        permitted_params[:name],
          description: permitted_params[:description],
          company:     permitted_params[:company],
          location:    permitted_params[:location]
        })
      end

    end
  end
end
