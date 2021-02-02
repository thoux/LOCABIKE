class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @homepage = true
    @bike_ads = BikeAd.ordered_by_date.limit(4)
  end

  def show
  end
end
