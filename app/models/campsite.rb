class Campsite < ActiveRecord::Base
    belongs_to :campground
    has_many :reservations
    has_many :users, through: :reservations
end