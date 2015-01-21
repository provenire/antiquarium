Rails.application.routes.draw do

  # Root
  root 'home#index'

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


  # Artifacts
  resources :artifacts


end
