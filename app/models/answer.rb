class Answer < ApplicationRecord
  belongs_to :question  # tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
  has_many :reations
end
