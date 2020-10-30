require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
    @article.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '記事の保存' do
    context '記事が保存できる場合' do
      it '画像とテキストとタイトルがあれば記事は保存される' do
        expect(@article).to be_valid
      end
    end
    context '記事が保存できない場合' do
      it 'テキストがないと記事は保存できない' do
        @article.text = ''
        @article.valid?
        expect(@article.errors.full_messages).to include('Textを入力してください')
      end
      it 'タイトルがないと記事は保存できない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include('Titleを入力してください')
      end
      it '画像がないと記事は保存できない' do
        @article.image = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Text can't be blank")
      end
      it 'ユーザーが紐付いていないと記事は保存できない' do
        @article.user = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
