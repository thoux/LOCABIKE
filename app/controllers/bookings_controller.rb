class BookingsController < ApplicationController
  before_action :set_bike, only: [:new, :create]
  before_action :set_booking, only: [:destroy, :approve]
  before_action :check_bike_available, only: [:new, :create]

  def new
    @booking = Booking.new
    @booking.bike_ad = @bike_ad
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bike_ad = @bike_ad
    @booking.user = current_user
    @booking.price = ((@booking.end_date - @booking.start_date) + 1) * @booking.bike_ad.price_per_day
    authorize @booking

    if @booking.save
      redirect_to user_path(@booking.user), notice: "Votre demande de réservation a été transmise à #{@bike_ad.user.first_name}"
    else
      render :new
    end
  end

  def destroy
    @user = current_user
    @booking.destroy
    redirect_to user_path(@user), notice: params[:flash_notice]
  end

  def approve
    @booking.update(pending: false)
    redirect_to user_path(@booking.bike_ad.user), notice: 'Votre accord a bien été pris en compte pour cette réservation'
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
    params.require(:booking).permit(:start_date, :end_date, :price)
  end

  def check_bike_available
    redirect_to root_path, alert: "La moto est reservée" unless @bike_ad.available == true
  end
end
