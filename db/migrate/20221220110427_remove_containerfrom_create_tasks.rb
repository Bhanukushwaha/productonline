class RemoveContainerfromCreateTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :string, :string

  end
end
