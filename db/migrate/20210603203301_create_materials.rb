class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|
      t.string :diy_name
      t.boolean :complete
      t.string :name
      t.integer :count
      t.belongs_to :diy, foreign_key: true

      t.timestamps
    end
  end
end
