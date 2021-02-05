class BookingsController < ApplicationController
  before_action :set_bike, only: [:new, :create]
  before_action :set_booking, only: [:destroy, :approve]
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
    @booking.destroy
    redirect_to user_path(@booking.user), notice: params[:flash_notice]
  end

  def approve
    @booking.update(pending: false)
    redirect_to user_path(@booking.user), notice: 'Votre accord a bien été pris en compte pour cette réservation'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

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
