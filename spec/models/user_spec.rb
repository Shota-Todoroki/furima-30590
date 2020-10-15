require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    it "nickname、last_name_kanjiとfirst_name_kanji、last_name_kanaとfirst_name_kanaとbirthday、email、passwordとpassword_confirmationが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "passwordが半角英数字混合の6文字以上であれば登録できる" do
      @user.password = "d041e5"
      @user.password_confirmation = "d041e5"
      expect(@user).to be_valid
    end
    it "last_name_kanjiが全角（ひらがな、カタカナ、漢字）であれば登録できる" do
      @user.last_name_kanji 
      expect(@user).to be_valid
    end
    it "first_name_kanjiが全角（ひらがな、カタカナ、漢字）であれば登録できる" do
      @user.first_name_kanji 
      expect(@user).to be_valid
    end
     it "last_name_kanaが全角（カタカナ）であれば登録できる" do
      @user.last_name_kana 
      expect(@user).to be_valid
    end
    it "first_name_kanaが全角（カタカナ）であれば登録できる" do
      @user.first_name_kana 
      expect(@user).to be_valid
    end
    
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "last_name_kanjiが空では登録できない" do
      @user.last_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
    end
    it "last_name_kanjiが数字では登録できない" do
      @user.last_name_kanji = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji is invalid")
    end 
    it "last_name_kanji英字では登録できない" do
      @user.last_name_kanji = "AIAIAI"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji is invalid")
    end
    
    it "first_name_kanjiが空では登録できない" do
      @user.first_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end
    it "first_name_kanjiが数字では登録できない" do
      @user.first_name_kanji = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid")
    end
    it "first_name_kanjiが英字では登録できない" do
      @user.first_name_kanji = "AIAIAI"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid")
    end

    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "last_name_kanaが全角（ひらがな）では登録できない" do
      @user.last_name_kana = "やまだ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it "last_name_kanaが全角（漢字）では登録できない" do
      @user.last_name_kana = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it "last_name_kanaが数字では登録できない" do
      @user.last_name_kana = "0000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it "last_name_kanaが英字では登録できない" do
      @user.last_name_kana = "Yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end 

    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "first_name_kanaが全角（ひらがな）では登録できない" do
      @user.first_name_kana = "たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "first_name_kanaが漢字では登録できない" do
      @user.first_name_kana = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "first_name_kanaが数字では登録できない" do
      @user.first_name_kana = "000"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "first_name_kanaが英字では登録できない" do
      @user.first_name_kana = "Yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end 

    it "birthdayが空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end   
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが空でなくても、password_confirmationが空なら登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが半角英数字混合且つ５文字以下では登録できない" do
      @user.password_confirmation = "a1a1a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
