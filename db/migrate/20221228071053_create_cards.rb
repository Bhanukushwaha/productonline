class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.boolean :is_done, default: false
      t.timestamps
    end
  end
end
