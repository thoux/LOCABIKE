class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @homepage = true
    @disable_container = true
    @disable_margins = true
    @bike_ads = BikeAd.available.ordered_by_date.limit(3)
  end

  def show
  end
end
