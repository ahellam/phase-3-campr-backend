class Campground < ActiveRecord::Base
    has_many :campsites
end