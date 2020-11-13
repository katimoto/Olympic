class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.references :answer, foreign_key: true
      t.references :user, foreign_key: true
      t.text :text, null: false
      t.timestamps
    end
  end
end
