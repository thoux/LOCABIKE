class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @users = policy_scope(User)
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def my_profile
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_id
  end

  def user_params
    params.require(:user).permit(:photo)
  end


end
