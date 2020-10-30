class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user
  has_many :answers
  has_one_attached :image
  has_many :likes

  validates :title, :text, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
