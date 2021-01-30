class BikeAd < ApplicationRecord
  belongs_to :user

  BRANDS = ['Yamaha', 'Honda', 'BMW', 'Ducati', 'Harley-Davidson']
  CATEGORIES = ['Cross', 'Enduro', 'Sport']

  validates :model, :brand, :category, :year, :address, :price_per_day, presence: true
  validates :brand, inclusion: { in: BRANDS }
  validates :category, inclusion: { in: CATEGORIES }
end
