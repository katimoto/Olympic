class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      # t.string :name, null: false #removeされたカラム
      t.string :text, null: false
      t.text :image
      t.timestamps
    end
  end
end
