class Room < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  has_many :room_users
  has_many :users, through: :room_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one :room_order

  validates :name, presence: true
  validates :category_id, numericality: { other_than: 1 } 
end
