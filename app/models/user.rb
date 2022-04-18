class User < ActiveRecord::Base
    has_many :reservations
    has_many :campgrounds, through: :reservations
    # do we need to add campsites???
end