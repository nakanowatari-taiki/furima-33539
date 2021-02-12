require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end
  describe '商品購入'do
  context '商品購入がうまくいかないとき' do
   it 'postal_codeが空だと保存できない時'do
    @purchase.postal_code = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Postal code can't be blank", "Postal code Input potal_code")
   end
   it 'delivery_area_idが空だと保存できない時'do
    @purchase.delivery_area_id = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Delivery area can't be blank", "Delivery area Select delivery_area_id")
   end
   it 'municipalityが空だと保存できない時'do
    @purchase.municipality = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Municipality can't be blank")
   end
   it 'addressが空だと保存できない時'do
    @purchase.address = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Address can't be blank")
   end
   it 'phone_numberが空だと保存できない時'do
    @purchase.phone_number = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Phone number can't be blank", "Phone number Input phone_number")
   end
   it 'postal_codeは、ハイフンがないと保存できない時'do
    @purchase.postal_code = "1234567"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Postal code Input potal_code")
   end
   it 'phone_numberは11桁以上では保存できない時'do
    @purchase.phone_number = "12345678912345"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Phone number Input phone_number")
   end
   it 'delivery_area_idは1以外出ないと保存できない時'do
   @purchase.delivery_area_id = "1"
   @purchase.valid?
   expect(@purchase.errors.full_messages).to include("Delivery area Select delivery_area_id")
  end
  it 'tokenが空では登録できないこと'do
   @purchase.token = ""
   @purchase.valid?
   expect(@purchase.errors.full_messages).to include("Token can't be blank")
  end
 end

 context '商品購入がうまくいく時' do
  it 'postal_code,delivery_area_id,municipality,address,phone_number,tokenがあれば購入できる'do
   expect(@purchase).to be_valid
  end
  it "postal_codeはハイフン込みの半角数字で購入できる"do
    @purchase.postal_code = "123-4567"
    expect(@purchase).to be_valid
  end

  it "phone_numberはハイフン不要で１１桁以内で半角数字で購入できる"do
    @purchase.phone_number = "09009090909"
    expect(@purchase).to be_valid
  end
 end 
end
  
end
