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
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      
      expect(another_user.errors.full_messages).to include("Surname is invalid", "Name is invalid")
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

    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.surname = ""
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "ユーザー本名は、全角（漢字、ひらがな、カタカナ）での入力が必須であること"do
    end
    it "ユーザー本名のフリガナは名字と名前でそれぞれ必須であること"do
    end
    it "ユーザー本名はフリガナは全角（カタカナ）での入力が必須であること"do
    end
    it "生年月日が必須であること" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

