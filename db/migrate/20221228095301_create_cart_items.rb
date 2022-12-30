class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.float   :unit_price
      t.float   :price
      t.boolean :is_done, default: false
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
