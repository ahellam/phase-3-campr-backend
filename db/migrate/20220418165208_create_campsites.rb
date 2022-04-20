class CreateCampsites < ActiveRecord::Migration[6.1]
  def change
    create_table :campsites do |t|
      t.string :camp_name
      t.integer :site_number
      t.string :img_url
      t.text :description
      t.integer :daily_price
      t.boolean :has_picnic_table
      t.boolean :has_firepit
      t.boolean :has_bathrooms
      t.boolean :has_rv_hookup
      t.belongs_to :campground, foreign_key: true
    end
  end
end
