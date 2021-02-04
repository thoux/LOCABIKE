class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def my_profile
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_id
  end

  def user_params
  params.require(:user).permit(:photo, :avatar)
  end


end
