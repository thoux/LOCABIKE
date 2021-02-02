class BookingsController < ApplicationController
  before_action :set_bike

  def new
    redirect_to root_path, notice: "La moto est reservée" unless @bike.available == true
    @user = current_user
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bike_ad = @bike
    @booking.user = current_user

    if @booking.save
      redirect_to bike_ad_path(@booking.bike_ad), notice: "La moto est louée"
    else
      render :new
    end
  end

  def delete
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def set_bike
    @bike = BikeAd.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
