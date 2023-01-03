class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :cart_id
      t.integer :product_id
      t.decimal :price
      t.string :decimal
      t.integer :quantity
      t.string :first_name
      t.string :last_name
      t.integer :email
      t.integer :phone
      t.string :country
      t.string :address
      t.string :town
      t.string :district
      t.string :postal_code
      t.text :description
      t.integer :address_id
      t.string :status, default: "pending"
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
