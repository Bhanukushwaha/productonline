class AddColumnToOrdersType < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :order_type, :string
  end
end
