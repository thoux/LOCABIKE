class BikeAdsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_bike_ad, only: [:show, :edit, :update, :destroy]

  def index
    @disable_margins = true
    if params[:query].present?
      sql_query = "model ILIKE :query OR brand ILIKE :query OR category ILIKE :query"
      @bike_ads = policy_scope(BikeAd).where(sql_query, query: "%#{params[:query]}%").ordered_by_date
    elsif params[:city].present?
      @bike_ads = policy_scope(BikeAd).near(params[:city].to_s, 10).ordered_by_date
    else
      @bike_ads = policy_scope(BikeAd).ordered_by_date
    end
    @markers = @bike_ads.geocoded.map do |bike_ad|
      {
        lat: bike_ad.latitude,
        lng: bike_ad.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { bike_ad: bike_ad })
      }
    end
    if @bike_ads.empty?
      @title_seo = "Aucune moto disponible à la location"
    elsif @bike_ads.size == 1
      @title_seo = "Une moto disponible à la location"
    else
      @title_seo = "#{@bike_ads.count} motos disponibles à la location"
    end

  end

  def new
    @title_seo = "Ajoutez une moto à louer"
    @bike_ad = BikeAd.new
    authorize @bike_ad
  end

  def create
    @bike_ad = BikeAd.new(params_bike_ad)
    authorize @bike_ad
    @bike_ad.user = current_user
    if @bike_ad.save
      redirect_to bike_ad_path(@bike_ad), notice: "Votre annonce a bien été créée"
    else
      render :new
    end
  end

  def show
    @title_seo = "#{@bike_ad.model} à louer sur Locabike"
    @booking = Booking.new
    authorize @booking
  end

  def edit; end

  def update
    @title_seo = "Editez votre annonce"
    if @bike_ad.update(params_bike_ad)
      redirect_to bike_ad_path(@bike_ad), notice: "Vos modifications ont bien été prises en compte"
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
    params.require(:bike_ad).permit(:model, :photo, :brand, :category, :year, :address, :price_per_day, :description, :available)
  end
end
