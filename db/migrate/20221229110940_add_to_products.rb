class AddToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products,:unit_price,:string
  end
end
