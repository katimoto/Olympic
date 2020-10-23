class Room < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  has_many :room_users, dependent: :destroy
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_one :room_order, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :price,
  numericality: {
    greater_than_or_equal_to: 300,
    less_than: 9999999
  }
  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :price, with: PRICE_REGEX, message: 'には半角数字で入力して下さい'
end
