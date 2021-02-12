class Purchase
  include ActiveModel::Model

  attr_accessor :phone_number,:postal_code,:delivery_area_id,:municipality,:address,:bulid,:user_id,:item_id, :token, :item_buy_id

  with_options presence: true do
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'Input phone_number' }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input potal_code' }
    validates :delivery_area_id, numericality: { other_than: 1, message: 'Select delivery_area_id'}
    validates :municipality
    validates :address
    validates :token
  end

  def save
    item_buy = ItemBuy.create(item_id: item_id, user_id: user_id)
    BuyerArea.create(phone_number: phone_number, postal_code: postal_code, delivery_area_id: delivery_area_id, municipality: municipality, address: address, bulid: bulid, item_buy_id: item_buy.id)
    
  end
end