class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :text, null: false
      t.text :image
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
