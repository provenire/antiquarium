Rails.application.routes.draw do

  use_doorkeeper


  # Root
  root 'home#index'


  # Admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'


  # User Sessions
  get    'login',  to: 'users/sessions#new',     as: :new_users_session
  post   'login',  to: 'users/sessions#create',  as: :create_users_session
  delete 'logout', to: 'users/sessions#destroy', as: :destroy_users_session

  # User Registrations
  get  'register', to: 'users/registrations#new',    as: :new_users_registration
  post 'register', to: 'users/registrations#create', as: :create_users_registration

  # User Reset Password
  post 'users/reset_password', to: 'users/reset_password#create', as: :create_users_reset_password
  get  'users/reset_password', to: 'users/reset_password#edit',   as: :edit_users_reset_password
  put  'users/reset_password', to: 'users/reset_password#update', as: :update_users_reset_password

  # Users
  get '/users/me', to: 'users#me', as: :my_session
  resources :users, except: [:new, :create, :destroy], defaults: { format: 'json' }


  # Artifacts
  resources :artifacts


  # Events
  resources :events, except: :index


  # People
  resources :people


  # Places
  resources :places


  # Sources
  resources :sources do
    resources :pages, param: :number
  end


  # Affiliations
  resources :affiliations, except: :index


  # PubSub
  post 'pubsub/auth', to: 'pubsub#auth', as: :auth_pubsub


  # Errors
  match '/404', via: :all, to: 'errors#not_found'
  match '/422', via: :all, to: 'errors#unprocessable_entity'
  match '/500', via: :all, to: 'errors#server_error'


  # Legal
  match '/legal/privacy_policy', via: :all, to: 'legal#privacy_policy', as: :privacy_policy






  # Development
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
