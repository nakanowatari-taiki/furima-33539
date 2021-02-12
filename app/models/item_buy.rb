class ItemBuy < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :buyer_area
end
