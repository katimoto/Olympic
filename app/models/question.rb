class Question < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :answers
end
