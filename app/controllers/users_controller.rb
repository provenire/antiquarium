class UsersController < ApplicationController
  before_action :ensure_user, except: ['show']

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

  end


  private

  def ensure_user
    current_user == User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :description)
  end

end
