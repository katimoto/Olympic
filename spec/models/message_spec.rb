require 'rails_helper'

RSpec.describe Message, type: :model do
  before '#create' do
    @message = FactoryBot.build(:message)
    @message.image = fixture_file_upload('public/images/test_image.png')
  end

  describe 'メッセージの保存' do
    context "メッセージが保存できる場合" do
      it 'contentとimageが存在していれば保存できること' do
        expect(@message).to be_valid
      end

      it 'contentが存在していれば保存できること' do
        @message.image = nil
        expect(@message).to be_valid
      end

      it 'imageが存在していれば保存できること' do
        @message.content = nil
        expect(@message).to be_valid
      end
    end
    context "メッセージが保存できない場合" do
      it 'contentとimageが空では保存できないこと' do
        @message.content = nil
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Contentを入力してください")
      end
    end
  end
end