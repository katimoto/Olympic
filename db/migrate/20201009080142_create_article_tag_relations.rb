class CreateArticleTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :article_tag_relations do |t|
      t.references :article, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
