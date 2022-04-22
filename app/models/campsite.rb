require 'pry'
class Campsite < ActiveRecord::Base
    belongs_to :campground
    has_many :reservations
    has_many :users, through: :reservations

    def self.filter_by_date_range(start_date, end_date)
        Campsite.all.filter do |site|
            is_available = true
            site.reservations.each do |res|
                is_available = !start_date.to_date.between?(res.start_date.to_date, res.end_date.to_date) && 
                !end_date.to_date.between?(res.start_date.to_date, res.end_date.to_date)
            end
            is_available
        end
    end

    def self.filter_by_price(upper_bound, camps)
        camps.filter do |site|
            site.daily_price < upper_bound.to_i
        end
    end

    def self.filter_by_amenities(amenities, camps)
        if amenities.empty? || amenities[:filter_price]
            return camps
        end
        camps.filter do |site|
            matches_filter = false
            amenities.map do |a|
                case a.first
                when "PICNIC_TABLE"
                    matches_filter = site.has_picnic_table
                    if !matches_filter 
                        break
                    end
                when "FIREPIT"
                    matches_filter = site.has_firepit
                    if !matches_filter 
                        break
                    end
                when "BATHROOMS"
                    matches_filter = site.has_bathrooms
                    if !matches_filter 
                        break
                    end
                when "RV_HOOKUP"
                    matches_filter = site.has_rv_hookup
                    if !matches_filter 
                        break
                    end
                end
            end
            matches_filter
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