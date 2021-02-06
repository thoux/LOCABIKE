class BikeAd < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  scope :available, -> { where(available: true) }
  scope :ordered_by_date, -> { order('updated_at DESC') }

  BRANDS = ['Yamaha', 'Honda', 'BMW', 'Ducati', 'Harley-Davidson']
  CATEGORIES = ['Cross', 'Enduro', 'Sport']

  validates :model, :brand, :category, :year, :address, :price_per_day, :description, :photo, presence: true
  validates :brand, inclusion: { in: BRANDS }
  validates :category, inclusion: { in: CATEGORIES }
end
