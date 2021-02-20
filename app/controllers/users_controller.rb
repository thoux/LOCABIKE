class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @users = policy_scope(User)
    authorize @users
  end

  def show
    @disable_container = true
    @disable_margins = true
    @user = User.find(params[:id])
    authorize @user
  end

  def my_profil
    @user = User.find(params[:id])
    @bike_ads = @user.bike_ads
    @bookings = Booking.joins(:bike_ad).where('bike_ads.user_id = ?', current_user.id)
    authorize @user
  end

  def user_params
    params.require(:user).permit(:banner, :avatar, :bio)
  end
end
