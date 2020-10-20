class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true, null: false
      t.references :article, foreign_key: true, null: false
      t.timestamps
      t.index [:user_id, :article_id], unique: true # 追加
    end
  end
end
