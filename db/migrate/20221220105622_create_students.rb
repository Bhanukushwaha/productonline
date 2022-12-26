class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :string
      t.string :email
      t.integer :mobile_no
      t.datetime :date
      t.string :image
      t.string :address
      t.boolean :status

      t.timestamps
    end
  end
end
