class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :hour
  has_many :payments  

  validates_uniqueness_of :user_id, scope: :hour_id, message: "Have you scheduled this time."

  def payment_status?
    hour.cost <= payments.where(:status => "true").sum(:value)
  end

  def status?
    hour.status?(user.id) && payment_status?
  end

  def status!
    if status?
      "Confirmed"
    elsif !payment_status?
      "Pending payment"
    else 
      "Canceled"
    end
  end
end
