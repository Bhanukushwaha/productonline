class AddColumnToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :size, :string
    add_column :products, :status, :string
  end
end
