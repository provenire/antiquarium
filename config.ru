# Load env
require 'dotenv'
Dotenv.load


# Set CORS
require 'rack/cors'
use Rack::Cors do
  allow do
    origins ENV['CORS_ORIGINS']
    resource '*', :headers => :any, :methods => [:get, :put, :post, :options]
  end
end


# Load rails
require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
