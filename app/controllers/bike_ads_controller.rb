class BikeAdsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_bike_ad, only: :show

  def index
    @bike_ads = BikeAd.all
  end

  def new
    @bike_ad = BikeAd.new
  end

  def create
    @bike_ad = BikeAd.new(params_bike_ad)
    @bike_ad.user = current_user
    if @bike_ad.save
      redirect_to bike_ad_path(@bike_ad)
    else
      render :new
    end
  end

  def show; end

  private

  def set_bike_ad
    @bike_ad = BikeAd.find(params[:id])
  end

  def params_bike_ad
    params.require(:bike_ad).permit(:model, :brand, :category, :year, :address, :price_per_day)
  end
end
