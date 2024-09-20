class ChangeColumnTypeToBigintForOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :phone, :string
  end
end
