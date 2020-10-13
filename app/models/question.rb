class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  
  belongs_to :user
  has_many :answers
  has_one_attached :image
  
  validates :text, presence: true
  validates :category_id, numericality: { other_than: 1 } 
end
