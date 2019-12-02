class Hour < ApplicationRecord
  belongs_to :arena
  has_many :schedules

  validates_presence_of :arena, :date, :time, :cost
  validates_uniqueness_of :time, scope: [:date, :arena], message: "This time is already registered for this arena."

  def status?(user_id)
    schedules.where(:user_id => user_id).where(:status => 'true').count != 0
  end

  def available?
    schedules.where(:status => 'true').count == 0
  end

  def period!
    "#{time.hour}:00h as #{time.hour+1}:00h"
  end

  def date!
    date.strftime('%d-%m-%Y')
  end
end
