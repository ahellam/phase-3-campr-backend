class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :campsite, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :price_total
      t.boolean :favorite
    end
  end
end
