class ArticlesTag

  include ActiveModel::Model
  attr_accessor :user_id, :text, :image, :word, :title

  with_options presence: true do
    validates :title
    validates :text ,length: {minimum: 50}
  end

  def save
    article = Article.create(user_id: user_id, title: title, text: text, image: image)
    tag = Tag.where(word: word).first_or_initialize
    tag.save

    ArticleTagRelation.create(article_id: article.id, tag_id: tag.id)
  end

  def update(article_id)
    article = Article.find(article_id)
    article_tag = article.tags
    article.update(user_id: user_id, title: title, text: text, image: image)
    article_tag.update(word: word)
  end

end