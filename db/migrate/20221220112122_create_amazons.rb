class CreateAmazons < ActiveRecord::Migration[6.1]
  def change
    create_table :amazons do |t|
      t.string :name
      t.string :email
      t.integer :mobile_no
      t.string :image
      t.datetime :date
      t.string :address
      t.boolean :status

      t.timestamps
    end
  end
end
