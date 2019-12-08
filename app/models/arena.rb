class Arena < ApplicationRecord
    has_many :hours
    validates_presence_of :name, :address

    #sync :all


    def current_hours
        hours.where(:date => Date.current..Date.current.end_of_month)
    end
end
