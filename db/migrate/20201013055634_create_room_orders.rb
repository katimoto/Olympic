class CreateRoomOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :room_orders do |t|
      t.references :room, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
