require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user.chinese_last_name = "山田"
    @user.chinese_first_name = "太郎"
    @user.japanese_last_name = "ヤマダ"
    @user.japanese_first_name = "タロウ"
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '全ての情報が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '既に登録されているemailでは登録できない' do
        @user.save
        @ano_user = FactoryBot.build(:user)
        @ano_user.chinese_last_name = "加藤"
        @ano_user.chinese_first_name = "新一"
        @ano_user.japanese_last_name = "カトウ"
        @ano_user.japanese_first_name = "シンイチ"
        @ano_user.email = @user.email
        @ano_user.valid?
        expect(@ano_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは6文字以上でないと登録できない' do
        @user.password = "12345"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは英字のみでは登録できない' do
        @user.password = "aaaaaaa"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角で英字と数字の両方を含めて設定してください")
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = "123456"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角で英字と数字の両方を含めて設定してください")
      end
      it 'passwordは全角が含まれると登録できない' do
        @user.password = "123TECH"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角で英字と数字の両方を含めて設定してください")
      end
      it 'passwordとpassword_confirmationは一致しないと登録できない' do
        @user.password = "123aaa"
        @user.password_confirmation = "123bbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'chinese_last_nameが空では登録できない' do
        @user.chinese_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Chinese last name can't be blank")
      end
      it 'chinese_first_nameが空では登録できない' do
        @user.chinese_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Chinese first name can't be blank")
      end
      it 'chinese_last_nameが英語では登録できない' do
        @user.chinese_last_name = "Yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Chinese last name 全角文字を使用してください")
      end
      it 'chinese_first_nameが英語では登録できない' do
        @user.chinese_first_name = "Tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Chinese first name 全角文字を使用してください")
      end
      it 'japanese_last_nameが空では登録できない' do
        @user.japanese_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Japanese last name can't be blank")
      end
      it 'japanese_first_nameが空では登録できない' do
        @user.japanese_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Japanese first name can't be blank")
      end
      it 'japanese_last_nameが英語では登録できない' do
        @user.japanese_last_name = "Yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Japanese last name 全角カナ文字を使用してください")
      end
      it 'japanese_last_nameが漢字では登録できない' do
        @user.japanese_last_name = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Japanese last name 全角カナ文字を使用してください")
      end
      it 'japanese_last_nameがひらがなでは登録できない' do
        @user.japanese_last_name = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Japanese last name 全角カナ文字を使用してください")
      end
      it 'japanese_first_nameが英語では登録できない' do
        @user.japanese_first_name = "Tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Japanese first name 全角カナ文字を使用してください")
      end
      it 'japanese_first_nameが漢字では登録できない' do
        @user.japanese_first_name = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Japanese first name 全角カナ文字を使用してください")
      end
      it 'japanese_first_nameがひらがなでは登録できない' do
        @user.japanese_first_name = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Japanese first name 全角カナ文字を使用してください")
      end
      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
