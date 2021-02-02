class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,        null: false
      t.integer :price,              null: false
      t.text :text,                  null: false
      t.references :user,            null: false,foreign_key: true
      t.integer :state_id,           null: false
      t.integer :categore_id,        null: false
      t.integer :delivery_burden_id, null: false
      t.integer :delivery_area_id,   null: false
      t.integer :delivery_days_id,   null: false

      t.timestamps
    end
  end
end
