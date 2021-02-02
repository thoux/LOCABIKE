class Booking < ApplicationRecord
  belongs_to :bike_ad
  belongs_to :user

  validates :start_date, :end_date, presence: true

  after_create :bike_is_not_available

  scope :past_booking, -> {  where("end_date < ?", Time.now).order(created_at: :asc) }
  scope :incomming_booking, -> {  where("end_date > ?", Time.now).order(created_at: :asc) }

  def bike_is_not_available
    @bike = bike_ad
    @bike.available = false
    @bike.save
  end

end
