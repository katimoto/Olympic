require 'rails_helper'

RSpec.describe Question, type: :model do
  before do
    @question = FactoryBot.build(:question)
    @question.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '質問の保存' do
    context "質問が保存できる場合" do
      it "画像とテキストがあれば質問は保存される" do
        expect(@question).to be_valid
      end
      it "テキストのみあれば質問は保存される" do
        @question.image = ""
        expect(@question).to be_valid
      end
      it "タイトル、画像、質問内容、質問のカテゴリーがあるとき" do
        expect(@question).to be_valid
      end
    end
    context "質問が保存できない場合" do
      it "タイトルが空のとき" do
        @question.title = ""
        @question.valid?
        expect(@question.errors.full_messages).to include("Titleを入力してください")
      end
      it "内容が空のとき" do
        @question.text = ""
        @question.valid?
        expect(@question.errors.full_messages).to include("Textを入力してください")
      end
      it "ルームのカテゴリーが空のとき" do
        @question.category_id = nil
        @question.valid?
        expect(@question.errors.full_messages).to include("Categoryを入力してください")
      end    
      it "ルームのカテゴリーが---のとき" do
        @question.category_id = 1
        @question.valid?
        expect(@question.errors.full_messages).to include("Categoryは1以外の値にしてください")
      end
      it "ユーザーが紐付いていないと質問は保存できない" do
        @question.user = nil
        @question.valid?
        expect(@question.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end