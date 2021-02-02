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
   validates :price,numericality: {greater_than_or_equal_to:300,less_than_or_equal_to: 99999999}
   validates :text
   validates :categore_id, numericality: { other_than: 1}
   validates :delivery_area_id, numericality: { other_than: 1}
   validates :delivery_burden_id, numericality: { other_than: 1}
   validates :delivery_days_id, numericality: { other_than: 1}
   validates :state_id, numericality: { other_than: 1}
  end
end