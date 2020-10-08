class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :name, null: false
      t.string :text, null: false
      t.text :image
      t.integer :category_id
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end