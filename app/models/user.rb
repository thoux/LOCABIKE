class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bike_ads
  has_many :bookings
  has_one_attached :avatar
  has_one_attached :banner

  scope :has_bike_ads, -> { includes(:bike_ads).where.not(bike_ads: { id: nil }) }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  validates :banner, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
