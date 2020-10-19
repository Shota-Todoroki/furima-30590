require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
    end
    it "name, description, category_id, condition_id, cost_burden_side_id, ship_form_id, days_to_ship_id, priceが存在すれば登録できる" do
      expect(@product).to be_valid
    end
    it "価格の下限が300円であれば登録できる" do
      @product.price = 300
      expect(@product).to be_valid
    end
    it "価格の上限が9999999円であれば登録できる" do
      @product.price = 9999999
      expect(@product).to be_valid
    end
   
    it "nameが空だと登録できない" do
      @product.name = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "descriptionが空だと登録できない" do
      @product.description = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Description can't be blank")
    end
    it "categoryが空だと登録できない" do
      @product.category_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    it "category_idが1だと登録できない" do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Category must be other than 1")
    end
    it "conditionが空だと登録できない" do
      @product.condition_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Condition can't be blank")
    end
    it "condition_idが1だと登録できない" do
      @product.condition_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Condition must be other than 1")
    end
    it "cost_burden_sideが空だと登録できない" do
      @product.cost_burden_side_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Cost burden side can't be blank")
    end
    it "cost_burden_side_idが1だと登録できない" do
      @product.cost_burden_side_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Cost burden side must be other than 1")
    end
    it "ship_formが空だと登録できない" do
      @product.ship_form_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Ship form can't be blank")
    end
    it "ship_form_idが1だと登録できない" do
      @product.ship_form_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Ship form must be other than 1")
    end
    it "days_to_shipが空だと登録できない" do
      @product.days_to_ship_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Days to ship can't be blank")
    end
    it "days_to_ship_idが1だと登録できない" do
      @product.days_to_ship_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Days to ship must be other than 1")
    end
    it "priceが空だと登録できない" do
      @product.price = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "imageが空だと登録できない" do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end
    it "価格の範囲が300円以下であれば登録できない" do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be greater than 299")
    end
    it "価格の範囲が9999999円以上であれば登録できない" do
      @product.price = 10000000
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be less than 10000000")
    end
    it "販売価格は半角数字でなければ登録できない" do
      @product.price = "３０００"
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is too short (minimum is 3 characters)")
    end
    it 'userが紐付いていないと保存できないこと' do
      @product.user = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("User must exist")
    end
  end
end