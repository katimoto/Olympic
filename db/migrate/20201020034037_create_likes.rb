class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :question, foreign_key: true, null: false
      t.index [:user_id, :question_id], unique: true # 追加
      t.timestamps
    end
  end
end
