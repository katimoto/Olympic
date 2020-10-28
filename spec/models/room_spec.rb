require 'rails_helper'
describe Room do
  before do
    @room = FactoryBot.build(:room)
    @room.image = fixture_file_upload('public/images/test_image.png')
  end
  describe 'ルーム出品' do
    context 'ルーム出品がうまくいくとき' do
      it "ルーム名、画像、ルームの説明、ルームのカテゴリー、販売価格があるとき" do
        expect(@room).to be_valid
      end
    end

    context 'ルーム出品がうまくいかないとき' do
      it "ルーム名が空のとき" do
        @room.name = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("Nameを入力してください")
      end
      it "出品画像が空のとき" do
        @room.image = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Imageを入力してください")
      end
      it "ルームの説明が空のとき" do
        @room.text = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("Textを入力してください")
      end
      it "ルームのカテゴリーが空のとき" do
        @room.category_id = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Categoryを入力してください")
      end
      it "ルームのカテゴリーが---のとき" do
        @room.category_id = 1
        @room.valid?
        expect(@room.errors.full_messages).to include("Categoryは1以外の値にしてください")
      end
      it "販売価格が空のとき" do
        @room.price = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("Priceを入力してください")
      end
      it "販売価格が300円~9999999円以外のとき" do
        @room.price = 10
        @room.valid?
        expect(@room.errors.full_messages).to include("Priceは300以上の値にしてください")
      end
      it "販売価格が300円~9999999円以外のとき" do
        @room.price = 100000000000
        @room.valid?
        expect(@room.errors.full_messages).to include("Priceは9999999より小さい値にしてください")
      end
    end
  end
end