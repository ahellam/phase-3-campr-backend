class FixAssociationsWithCampgroundToCampsites < ActiveRecord::Migration[6.1]
  def change
    remove_reference :campgrounds, :campsite, index: true, foreign_key: true
    add_reference :campsites, :campground, index: true, foreign_key: true
  end
end
