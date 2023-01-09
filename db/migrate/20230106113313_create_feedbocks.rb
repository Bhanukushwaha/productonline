class CreateFeedbocks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.integer :product_id
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
