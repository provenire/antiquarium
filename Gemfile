source 'https://rubygems.org'


# Core
gem 'rails', '4.2.0'
gem 'pg'
gem 'unicorn'
gem 'dalli'


# API
gem 'grape'
gem 'hashie_rails'
gem 'active_model_serializers', '~> 0.9.3'
gem 'grape-active_model_serializers'
gem 'grape-kaminari'



# Authentication
gem 'rack-cors', :require => 'rack/cors'
gem 'sorcery'
gem 'cancancan'
gem 'doorkeeper'
gem 'wine_bouncer'


# Meta
gem 'paper_trail', '~> 4.0.0.beta'
gem 'mailboxer', github: 'div/mailboxer', branch: 'rails42-foreigner'
#gem 'socialization' # https://github.com/cmer/socialization


# Resources
gem 'friendly_id'
gem 'money-rails'
gem 'embedly'
gem 'transloadit'
gem 'rest-client'
#gem 'attribute_normalizer' # https://github.com/mdeering/attribute_normalizer


# UI
gem 'kaminari'
gem 'citeproc'
gem 'citeproc-ruby'
gem 'csl-styles'
gem 'pusher'


# Files
gem 'carrierwave'
gem 'cloudinary'
gem 'fog',        '1.26.0'


# Admin
gem 'rails_admin'



# Workers and Queueing
gem 'delayed_job_active_record'


# Monitoring
gem 'newrelic_rpm'



# Documentation
gem 'annotate'
gem 'sdoc', '~> 0.4.0', group: :doc


# Development
group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'quiet_assets'
  gem 'railroady'
  gem 'dotenv'
  gem 'dotenv-rails'
  gem 'letter_opener'
  gem 'letter_opener_web'
  gem 'yaml_db'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
end


# Production
group :production do
  gem 'rails_12factor'
end


ruby '2.2.0'
