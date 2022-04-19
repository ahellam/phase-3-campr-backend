require 'pry'
class Campsite < ActiveRecord::Base
    belongs_to :campground
    has_many :reservations
    has_many :users, through: :reservations

    def self.filter_by_date_range(start_date, end_date)
        return_value = []
        Campsite.all.filter do |site|
            is_available = true
            site.reservations.each do |res|
                is_available = !start_date.to_date.between?(res.start_date.to_date, res.end_date.to_date) && 
                !end_date.to_date.between?(res.start_date.to_date, res.end_date.to_date)
            end
            is_available
        end
    end

    def self.price_range(upper_bound, lower_bound=0)
        Campsite.all.filter do |site|
            site.daily_price.between?(lower_bound, upper_bound)
        end
    end

    # params: amenities = hash of amenities
    # returns filtered results dependent on params
    def self.has_amenities?(amenities)
        Campsite.all.where(amenities)
    end
end