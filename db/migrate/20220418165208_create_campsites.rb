class CreateCampsites < ActiveRecord::Migration[6.1]
  def change
    create_table :campsites do |t|
      t.integer :site_number
      t.boolean :has_picnic_table
      t.boolean :has_firepit
      t.boolean :has_bathrooms
      t.boolean :has_rv_hookup
      t.integer :daily_price
    end
  end
end
