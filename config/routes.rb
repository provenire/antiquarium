Rails.application.routes.draw do

  use_doorkeeper do
    skip_controllers :applications, :authorized_applications
  end


  mount API::Base => '/'


  # Admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'





  # # User Registrations
  # get  'register', to: 'users/registrations#new',    as: :new_users_registration
  # post 'register', to: 'users/registrations#create', as: :create_users_registration
  #
  # # User Reset Password
  # post 'users/reset_password', to: 'users/reset_password#create', as: :create_users_reset_password
  # get  'users/reset_password', to: 'users/reset_password#edit',   as: :edit_users_reset_password
  # put  'users/reset_password', to: 'users/reset_password#update', as: :update_users_reset_password


  # # Affiliations
  # resources :affiliations, except: :index


  # # PubSub
  # post 'pubsub/auth', to: 'pubsub#auth', as: :auth_pubsub


  # # Legal
  # match '/legal/privacy_policy', via: :all, to: 'legal#privacy_policy', as: :privacy_policy






  # Development
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
