class Article < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :favorites  
end
