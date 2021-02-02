require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品" do
    context '商品出品がうまくいかないとき' do
      it "product_nameが空だと登録できない"do
      @item.product_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "priceが空だとと登録できない"do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
      end
      it "textが空だとと登録できない"do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "state_idが空だと登録できない"do
      @item.state_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank", "State is not a number")
      end
      it "categore_id空だと登録できない"do
      @item.categore_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Categore can't be blank", "Categore is not a number")
      end
      it "delivery_burden_idが空だと登録できない" do
      @item.delivery_burden_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery burden can't be blank", "Delivery burden is not a number")
      end
      it "delivery_area_idが空だと登録できない" do
      @item.delivery_area_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery area can't be blank", "Delivery area is not a number")
      end
      it "delivery_days_idが空だと登録できない"do
      @item.delivery_days_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery days can't be blank", "Delivery days is not a number")
      end
      it "priceの範囲が¥300以下は登録できない"do
      @item.price = "100"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceの範囲が¥9,999,999以上は登録できない"do
      @item.price = "100000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 99999999")
      end
      it "priceは半角数字以外では登録できない"do
      @item.price = "四百"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "imageがないと登録できない"do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "金額が半角でないと登録できない"do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
    context '商品出品がうまくいく時' do
      it "product_name,price,text,state_id,categore_id,deliver_burden_id,delivery_area_id,delivery_days_id,imageがあると商品を出品できる"do
      expect(@item).to be_valid
      end
      it "priceは¥300~¥9,999,999の間だと登録できる"do
      @item.price = "1000"
      expect(@item).to be_valid
      end
    end
  end

end
