class CreateCampgrounds < ActiveRecord::Migration[6.1]
  def change
    create_table :campgrounds do |t|
      t.belongs_to :campsite, foreign_key: true
      t.string :camp_name
      t.boolean :is_full
    end
  end
end
