class Hour < ApplicationRecord
  belongs_to :arena
  has_many :schedules

  def status?(user_id)
    schedules.where(:user_id => user_id).where(:status => 'true').count != 0
  end

  def period!
    "#{time.hour}:00h as #{time.hour+1}:00h"
  end

  def date!
    time.strftime('%d-%m-%Y')
  end
end
