class Booking < ApplicationRecord
  belongs_to :bike_ad
  belongs_to :user

  validates :start_date, :end_date, :price, presence: true
  validate  :start_date_greater_than_yesterday?
  validate  :end_date_after_start_date?

  after_create :toggle_available
  after_destroy :toggle_available

  scope :past_booking, -> { where("end_date < ?", Time.now).order(created_at: :asc) }
  scope :incomming_booking, -> { where("end_date > ?", Time.now).order(created_at: :asc) }

  private

  def toggle_available
    bike_ad.toggle(:available).save
  end

  def start_date_greater_than_yesterday?
    return if start_date.blank?

    errors.add(:start_date, "doit commencer à partir d'aujourd'hui ou plus") if start_date < Date.today
  end

  def end_date_after_start_date?
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "doit être supérieure à la date de début") if end_date <= start_date
  end
end
