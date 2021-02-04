class Booking < ApplicationRecord
  belongs_to :bike_ad
  belongs_to :user

  validates :start_date, :end_date, presence: true

  after_create :toggle_available
  after_destroy :toggle_available

  scope :past_booking, -> {  where("end_date < ?", Time.now).order(created_at: :asc) }
  scope :incomming_booking, -> {  where("end_date > ?", Time.now).order(created_at: :asc) }

  def toggle_available
    bike_ad.toggle(:available).save
  end


end
