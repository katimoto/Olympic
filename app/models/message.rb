class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
  
  validates :content, presence: true, length: { maximum: 500 }, unless: :was_attached?
  validates :user_id, presence: true

  def was_attached?
    self.image.attached?
  end
end
