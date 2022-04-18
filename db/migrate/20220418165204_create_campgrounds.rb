class CreateCampgrounds < ActiveRecord::Migration[6.1]
  def change
    create_table :campgrounds do |t|
      t.string :camp_name
      t.boolean :is_full
    end
  end
end
