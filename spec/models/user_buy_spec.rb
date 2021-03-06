require 'rails_helper'

RSpec.describe UserBuy, type: :model do
  describe '#create' do
    before do
      @user_buy = FactoryBot.build(:user_buy)
    end
    it "全ての値が正しく入力されていれば保存することができる" do
      expect(@user_buy).to be_valid
    end
    it "建物の名前が空でも保存することができる" do
      @user_buy.building_name = ""
      expect(@user_buy).to be_valid
    end

    it "郵便番号が空だと保存できない" do
      @user_buy.postal_code = ""
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Postal code can't be blank")
    end
    it "郵便番号にハイフンが無いと保存できない" do
      @user_buy.postal_code = "3043349"
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it "都道府県名が空だと保存できない" do
      @user_buy.region_id = ""
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Region can't be blank")
    end
    it "都道府県名のIDが1だと登録できない" do
      @user_buy.region_id = 1
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Region can't be blank")
    end
    it "市区町村が空だと保存できない" do
      @user_buy.city = ""
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("City can't be blank")
    end
    it "番地が空だと保存できない" do
      @user_buy.address = ""
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Address can't be blank")
    end
    it "電話番号が空だと保存できない" do
      @user_buy.phone_number = ""
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号にハイフンがあると保存できない" do
      @user_buy.phone_number = "080[-]0987[-]6543"
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Phone number is invalid")
    end
    it "電話番号が12桁以上だと保存できない" do
      @user_buy.phone_number = "080[-]09871[-]65431"
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Phone number is invalid")
    end
    it "tokenが空では登録できないこと" do
      @user_buy.token = nil
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Token can't be blank")
    end
  end
end
