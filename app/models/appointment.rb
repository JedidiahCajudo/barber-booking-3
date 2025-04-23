class Appointment < ApplicationRecord
  belongs_to :member

  validates :start_time, presence: true
  validate :start_time_within_business_hours

  private

  def start_time_within_business_hours
    if start_time.present?
      # Set time range (9 AM to 5 PM)
      business_start = start_time.beginning_of_day + 10.hours
      business_end = start_time.beginning_of_day + 20.hours

      if start_time < business_start || start_time > business_end
        errors.add(:start_time, "must be between 10:00 AM and 20:00 PM")
      end
    end
  end
end
