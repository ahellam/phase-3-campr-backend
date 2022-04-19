class Reservation < ActiveRecord::Base
    belongs_to :user
    belongs_to :campsite

    # def delete

    # end
end