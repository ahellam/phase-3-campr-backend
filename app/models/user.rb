class User < ActiveRecord::Base
    has_many :reservations
    has_many :campsites, through: :reservations
end