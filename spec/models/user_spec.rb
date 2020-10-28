require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
    @user.image = fixture_file_upload('public/images/test_image.png')
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "名前とemail、、passwordとpassword_confirmation、画像、経歴、自己紹介が存在していれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "test123"
        @user.password_confirmation = "test123"
        expect(@user).to be_valid
      end
      it "メールアドレスは@を含んでいる" do
        @user.email = "test@gmail.com"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "名前が空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "emailは@を含んでいないと登録できない" do
        @user.email = "test.gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが半角英数字混合でないと登録できない(take1)" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordが半角英数字混合でないと登録できない(take2)" do
        @user.password = "abcdef"
        @user.password_confirmation = "abedef"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end