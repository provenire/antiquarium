Rails.application.routes.draw do
  
  # Administration
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  

  # Keep the door
  use_doorkeeper do
    skip_controllers :applications, :authorized_applications
  end


  # PubSub
  # post '/pubsub/auth', to: 'pubsub#auth', as: :auth_pubsub
  

  # API
  mount API::Base => '/'









  # Development
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
