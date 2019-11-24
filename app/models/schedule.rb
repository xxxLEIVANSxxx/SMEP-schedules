class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :hour
  has_many :payments

  def payment_status?
    hour.cost <= payments.where(:status => "true").sum(:value)
  end

  def payment_status!
    if payment_status?
      "Confirmed"
    else      
      "Pending payment"
    end
  end
end
