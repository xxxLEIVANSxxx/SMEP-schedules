class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :hour

  def payment_status?
    hour.cost <= Payment.where(:schedule_id => id).where(:status => "true").sum(:value)
  end

  def payment_status!
    if payment_status?
      "Confirmed"
    else      
      "Pending payment"
    end
  end
end
