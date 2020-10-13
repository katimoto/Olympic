class ArticlesTag

  include ActiveModel::Model
  attr_accessor :user_id, :text, :image, :word, :title

  with_options presence: true do
    validates :text, :title
  end

  def save
    article = Article.create(user_id: user_id, title: title, text: text, image: image)
    tag = Tag.where(word: word).first_or_initialize
    tag.save

    ArticleTagRelation.create(article_id: article.id, tag_id: tag.id)
  end

end