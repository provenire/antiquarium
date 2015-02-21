class UsersController < ApplicationController
  before_action :ensure_user, except: ['show','me']

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash.now[:success] = 'Profile updated successfully!'
      redirect_to edit_user_path(@user)
    else
      render :edit
    end
  end

  def me
    render json: current_user
  end


  private

  def ensure_user
    current_user == User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :description, :company, :location)
  end

end
