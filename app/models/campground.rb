class Campground < ActiveRecord::Base
    has_many :campsites
    has_many :reservations
    has_many :users, through: :reservations
end