class AddUserColumnToMaterials < ActiveRecord::Migration[6.1]
  def change
    add_column :materials, :user_id, :integer
  end
end
