require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'test1234'
        @user.password_confirmation = 'test1234'
        expect(@user).to be_valid
      end
      it 'family_nameとlast_nameが全角であれば登録できる' do
        @user.family_name = 'てすと'
        @user.last_name = 'ほげ'
        expect(@user).to be_valid
      end
      it 'family_name_kanaとlast_name_kanaが全角であれば登録できる' do
        @user.family_name_kana = 'テスト'
        @user.last_name_kana = 'ホゲ'
        expect(@user).to be_valid
      end
    end
    context '新規登録出来ない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'hoge5678'
        @user.password_confirmation ='test1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password = '111111'
        @user.password_confirmation ='111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it 'passwordが英字だけだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it 'passwordが全角だと登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it 'passwordが英数字混合でも6文字未満なら登録できない' do
        @user.password ='test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailには@が含まれていないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid. Input full-width characters")
      end
      it 'family_nameが半角では登録できない' do
        @user.family_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid. Input full-width characters")
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank",
          "Family name kana is invalid. Input full-width katakana characters")
      end
      it 'family_name_kanaが半角では登録できない' do
        @user.family_name_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid. Input full-width katakana characters")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid. Input full-width katakana characters")
      end
      it 'last_name_kanaが半角では登録できない' do
        @user.last_name_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
