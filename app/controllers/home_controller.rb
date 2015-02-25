class HomeController < ApplicationController

  def index
    render json: { name: 'Antiquarium' }
  end

end
