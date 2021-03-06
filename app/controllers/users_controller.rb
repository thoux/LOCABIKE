class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @title_seo = "Découvrez les LocaBikers"
    @users = policy_scope(User)
    authorize @users
  end

  def show
    @disable_container = true
    @disable_margins = true
    @user = User.find(params[:id])
    @title_seo = "Découvrez le profil de #{@user.first_name}"
    authorize @user
    @bike_ads = @user.bike_ads.order('available DESC')
  end

  def my_profil
    @title_seo = "Votre administration Locabike"
    @user = User.find(params[:id])
    @bike_ads = @user.bike_ads
    @bookings = Booking.joins(:bike_ad).where('bike_ads.user_id = ?', current_user.id)
    authorize @user
  end

  def user_params
    params.require(:user).permit(:banner, :avatar, :bio)
  end
end
