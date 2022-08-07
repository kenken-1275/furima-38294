class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :post_number,null: false
      t.integer :area_id,null: false
      t.string :city,null: false
      t.string :address,null: false
      t.string :building_name
      t.string :tel_number,null: false
      t.references :dealing,null: false,foreign_key: true
      t.timestamps
    end
  end
end
