class BookingsController < ApplicationController
  before_action :set_bike, only: [:new, :create]
  before_action :check_bike_available, only: [:new, :create]

  def new
    @user = current_user
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.bike_ad = @bike_ad
    @booking.user = current_user

    if @booking.save
      redirect_to user_path(@booking.user), notice: "La moto est louée"
    else
      render :new
    end
  end

  def destroy
    @user = current_user
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to @user
  end

  private

  def set_bike
    @bike_ad = BikeAd.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def check_bike_available
    redirect_to root_path, alert: "La moto est reservée" unless @bike_ad.available == true
  end
end
