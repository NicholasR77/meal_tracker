class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :calories
      t.integer :total_fat
      t.integer :cholesterol
      t.integer :sodium
      t.integer :total_carbs
      t.integer :protein
    end
  end
end
