Rails.application.routes.draw do

  # Keep the door
  use_doorkeeper do
    skip_controllers :applications, :authorized_applications
  end


  # Administration
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'


  # PubSub
  # post '/pubsub/auth', to: 'pubsub#auth', as: :auth_pubsub
  

  # API
  mount API::Base => '/'









  # Development
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
