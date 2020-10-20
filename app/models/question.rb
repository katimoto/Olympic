class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  
  belongs_to :user
  has_many :answers
  has_one_attached :image
  has_many :likes
  
  validates :text, presence: true
  validates :category_id, numericality: { other_than: 1 } 

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
