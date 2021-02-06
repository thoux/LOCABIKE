class BikeAdsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_bike_ad, only: [:show, :edit, :update, :destroy]

  def index
    @bike_ads = policy_scope(BikeAd).ordered_by_date
  end

  def new
    @bike_ad = BikeAd.new
    authorize @bike_ad
  end

  def create
    @bike_ad = BikeAd.new(params_bike_ad)
    authorize @bike_ad
    @bike_ad.user = current_user
    if @bike_ad.save
      redirect_to bike_ad_path(@bike_ad)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @bike_ad.update(params_bike_ad)
      redirect_to bike_ad_path(@bike_ad)
    else
      render :edit
    end
  end

  def destroy
    @bike_ad.destroy
    redirect_to bike_ads_path
  end

  private

  def set_bike_ad
    @bike_ad = BikeAd.find(params[:id])
    authorize @bike_ad
  end

  def params_bike_ad
    params.require(:bike_ad).permit(:model, :photo, :brand, :category, :year, :address, :price_per_day, :available)
  end
end
