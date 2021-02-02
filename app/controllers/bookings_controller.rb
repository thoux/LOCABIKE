class BookingsController < ApplicationController
  before_action :set_bike, only: [:new, :create]

  def new
    redirect_to root_path, notice: "La moto est reservée" unless @bike_ad.available == true
    @user = current_user
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
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

    @bike = @booking.bike_ad
    @bike.update(available: true)

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
end