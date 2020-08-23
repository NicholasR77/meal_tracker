class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :height
      t.integer :weight
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
