class Article < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :article_tag_relations
  has_many :tags, through: :article_tag_relations, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :text, :title, :image, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
