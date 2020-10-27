require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nameが空だと登録できない" do
      user = User.new(name: "", email: "kkk@gmail.com", password: "moyashi123", password_confirmation: "moyashi123")
      user.valid?
      expect(user.errors.full_messages).to include("名前を入力してください")
    end
    it "emailが空では登録できない" do
    end
  end
end