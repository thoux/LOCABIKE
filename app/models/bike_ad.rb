class BikeAd < ApplicationRecord
  belongs_to :user
  scope :available, -> { where(available: true) }
  scope :ordered_by_date, -> { order('updated_at DESC') }

  BRANDS = ['Yamaha', 'Honda', 'BMW', 'Ducati', 'Harley-Davidson']
  CATEGORIES = ['Cross', 'Enduro', 'Sport']

  validates :model, :brand, :category, :year, :address, :price_per_day, presence: true
  validates :brand, inclusion: { in: BRANDS }
  validates :category, inclusion: { in: CATEGORIES }
  has_one_attached :photo
end
