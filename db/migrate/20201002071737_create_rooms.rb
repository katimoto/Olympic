class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :text, null: false
      t.integer :category_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
