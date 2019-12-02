class Payment < ApplicationRecord
  belongs_to :schedule

  validates_presence_of :schedule, :form, :value
end