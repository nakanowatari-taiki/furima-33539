require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    it "nicknameが空では登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "重複したemailが存在する場合は登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@を含む必要があること" do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordは６文字以上であること" do
      @user.password = "11111"
      @user.password_confirmation = "11111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは半角英数字が必要であること" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordは確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordと確認用passwordの値が一致すること" do
      @user.password = "aaaaa5"
      @user.password_confirmation = "aaaaa6"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordは数字のみでは登録できない" do
      @user.password = "555555"
      @user.password_confirmation = "555555"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordは全角では登録できない" do
      @user.password = "おおおおa1"
      @user.password_confirmation = "おおおおa1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end


    it "ユーザー本名は、名字が必須であること" do
      @user.surname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank", "Surname is invalid")
    end
    it "ユーザー本名は名前が必須であること"do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank", "Name is invalid")
    end
    it "ユーザー本名はsurnameが、全角（漢字、ひらがな、カタカナ）での入力が必須であること"do
      @user.surname = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname is invalid")
    end

    it "ユーザー本名はnameが、全角（漢字、ひらがな、カタカナ）での入力が必須であること"do
      @user.name = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name is invalid")
    end
    it "ユーザー本名のフリガナはkana_nameが必須であること"do
      @user.kana_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana name can't be blank", "Kana name is invalid")
    end
    it "ユーザー本名のフリガナはkana_surnameが必須であること"do
      @user.kana_surname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana surname can't be blank", "Kana surname is invalid")
    end

    it "ユーザー本名kana_nameはフリガナ全角（カタカナ）以外では登録できないこと"do
       @user.kana_name = "たなか"
       @user.kana_name = "123"
       @user.kana_name = "田中"
       @user.valid?
       expect(@user.errors.full_messages).to include("Kana name is invalid")
    end



    it "ユーザー本名kana_surnameフリガナは全角（カタカナ）以外では登録できないこと"do
       @user.kana_surname = "たなか"
       @user.kana_surname = "123"
       @user.kana_surname = "田中"
       @user.valid?
       expect(@user.errors.full_messages).to include("Kana surname is invalid")
    end

    it "ユーザーの本名は漢字、ひらがな、カタカナ以外は登録できないこと" do
       @user.name = "12345"
       @user.surname = "12345"
       @user.valid?
       expect(@user.errors.full_messages).to include("Surname is invalid", "Name is invalid")
    end

    it "生年月日が必須であること" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

