class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bike_ads

  has_one_attached :avatar
  has_one_attached :banner

  has_many :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :address, presence: true
  validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  validates :banner, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
