require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
        expect(@user).to be_valid
        end

        it "passwordが6文字以上であれば登録できること" do
          @user.password = "123456"
          @user.password_confirmation = "123456"
          expect(@user).to be_valid
        end
      end
      context '新規登録できないとき' do
        it "nick_nameが空では登録できないこと" do
          @user.nick_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nick name can't be blank")
        end

        it "emailが空では登録できないこと" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "passwordが空では登録できないこと" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end    

        it "passwordが5文字以下であれば登録できないこと" do
          @user.password = "12345"
          @user.password_confirmation = "12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it "passwordが半角英数字混合でなければ登録できないこと" do
          @user.password = "ＡＢＣＤＥＦ"
          @user.password_confirmation = "ＡＢＣＤＥＦ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password 半角英数字を使用してください")
        end

        it "passwordとpassword_confirmationが不一致では登録できないこと" do
          @user.password = "123456"
          @user.password_confirmation = "1234567"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "passwordが半角英語のみでは登録できないこと" do
          @user.password = "abcdef"
          @user.password_confirmation = "abcdef"
          @user.valid?
          expect(@user.errors.full_messages).to include()
        end

        it "passwordが数字のみでは登録できないこと" do
          @user.password = "123456"
          @user.password_confirmation = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include()
        end

        it "重複したemailが存在する場合登録できないこと" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it "emailに@がない場合は登録できないこと" do
          @user.email = "samplegmail.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it "生年月日が空では登録できないこと" do
          @user.birth_day = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
        end

        it "family_nameが全角入力でなければ登録できないこと" do
          @user.family_name = "ｱｲｳｴｵ"
          @user.valid?
          expect(@user.errors[:family_name]).to include("全角文字を使用してください")
        end

        it "first_nameが全角入力でなければ登録できないこと" do
          @user.first_name = "ｱｲｳｴｵ"
          @user.valid?
          expect(@user.errors[:first_name]).to include("全角文字を使用してください")
        end

        it "family_name_kanaが全角カタカナでなければ登録できないこと" do
          @user.family_name_kana = "あいうえお"
          @user.valid?
          expect(@user.errors[:family_name_kana]).to include("全角カタカナを使用してください")
        end

        it "first_name_kanaが全角カタカナでなければ登録できないこと" do
          @user.first_name_kana = "あいうえお"
          @user.valid?
          expect(@user.errors[:first_name_kana]).to include("全角カタカナを使用してください")
        end

        it "family_nameが空では登録できないこと" do
          @user.family_name = nil
          @user.valid?
          expect(@user.errors[:family_name]).to include("can't be blank", "全角文字を使用してください")
        end

        it "first_nameが空では登録できないこと" do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors[:first_name]).to include("can't be blank", "全角文字を使用してください")
        end

        it "family_name_kanaが空では登録できないこと" do
          @user.family_name_kana = nil
          @user.valid?
          expect(@user.errors[:family_name_kana]).to include("can't be blank", "全角カタカナを使用してください")
        end

        it "first_name_kanaが空では登録できないこと" do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors[:first_name_kana]).to include("can't be blank", "全角カタカナを使用してください")
        end
      end
    end
  end
end