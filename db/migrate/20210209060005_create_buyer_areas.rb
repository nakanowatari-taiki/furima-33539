class CreateBuyerAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_areas do |t|

      t.string     :phone_number,     null: false
      t.string     :postal_code,      null: false
      t.integer    :delivery_area_id, null: false
      t.string     :municipality,     null: false
      t.string     :address,          null: false
      t.references :item_buy,         null: false,foreign_key:true
      t.string     :bulid


      t.timestamps
    end
  end
end
