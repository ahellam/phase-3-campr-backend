require 'pry'
class Reservation < ActiveRecord::Base
    belongs_to :user
    belongs_to :campsite

    # # campsites are available in a date range
    # def self.filter_by_date_range(start_date, end_date)
    #     # iterate through all reservations to check date range
    #     # if reservation falls outside of date range return campsite
    #     #[c1, c2, c1, c1, c3, c4 ,c5 ]
    #     Campsite.filter_by_date_range(start_date, end_date)
    # end

    def calculate_total_price
        start_d = self.start_date.to_date
        end_d = self.end_date.to_date
        daily_price = self.campsite.daily_price
        total_days = (end_d - start_d).to_i
        total_days*daily_price
    end
end