class Question < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :answers
  has_one_attached :image
end
