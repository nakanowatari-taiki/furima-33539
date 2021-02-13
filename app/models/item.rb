class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :categore
  belongs_to :delivery_area
  belongs_to :delivery_burden
  belongs_to :delivery_days
  belongs_to :state
  has_one_attached :image

  with_options presence: true do
   validates :image
   validates :product_name
   validates :price, numericality: {greater_than_or_equal_to:300,less_than_or_equal_to: 99999999},format: {with:  /\A[0-9]+\z/}
   validates :text
   with_options numericality: { other_than: 1} do
   validates :categore_id
   validates :delivery_area_id
   validates :delivery_burden_id
   validates :delivery_days_id
   validates :state_id
   end
  end
  belongs_to :user
  has_one :item_buy
end


