class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :hour
  has_many :payments

  def payment_status?
    hour.cost <= payments.where(:status => "true").sum(:value)
  end

  def status!
    if hour.status?(user.id) && payment_status?
      "Confirmed"
    elsif !payment_status?
      "Pending payment"
    else 
      "Canceled"
    end
  end
end
