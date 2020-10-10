class Article < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :favorites  
  has_many :article_tag_relations
  has_many :tags, through: :article_tag_relations

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
