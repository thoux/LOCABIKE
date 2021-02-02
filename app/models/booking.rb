class Booking < ApplicationRecord
  belongs_to :bike_ad
  belongs_to :user

  validates :start_date, :end_date, presence: true

  scope :past_booking, -> {  where("end_date < ?", Time.now).order(created_at: :asc) }
  scope :incomming_booking, -> {  where("end_date > ?", Time.now).order(created_at: :asc) }
end
