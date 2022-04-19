require 'pry'
class User < ActiveRecord::Base
    has_many :reservations
    has_many :campsites, through: :reservations

    def get_reservations
        self.reservations.map do |res|
            campground_name = res.campsite.campground.camp_name
            campsite_number = res.campsite.site_number
            start_date = res.start_date.to_date
            end_date = res.end_date.to_date
            "Your reservation at #{campground_name} site:#{campsite_number} on #{start_date} - #{end_date} is RESERVED!"
        end
    end
end