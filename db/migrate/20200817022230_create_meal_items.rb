class CreateMealItems < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_items do |t|
      t.integer :meal_id
      t.integer :item_id

      t.timestamps
    end
  end
end
