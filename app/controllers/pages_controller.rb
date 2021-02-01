class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @homepage = true
    @bike_ads = BikeAd.where(available: true).order('updated_at DESC').limit(4)
  end

  def show
  end
end
