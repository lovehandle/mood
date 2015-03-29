class Schedule < ActiveRecord::Base

  belongs_to :question
  belongs_to :from, foreign_key: :from_id, class: Phone
  belongs_to :to, foreign_key: :to_id, class: Phone

  validates :question, presence: true
  validates :from, presence: true
  validates :to, presence: true
  validates :time_offset, presence: true
  validates :zone_offset, presence: true

  def wait_until(date = nil)
    date ||= Date.today

    year = date.year
    month = date.month
    day = date.day

    hours = (time_offset / (60 * 60)) % 24
    minutes = (time_offset / 60) % 60
    seconds = time_offset % 60

    offset = [ (zone_offset / (60 * 60)), (zone_offset % 60) ].join(":")

    if zone_offset > 0
      offset = "+" + offset
    end

    DateTime.new(year, month, day, hours, minutes, seconds, offset)
  end

end
