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


end
