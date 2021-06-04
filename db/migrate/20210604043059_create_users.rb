class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :island_name
      t.string :username
      t.string :email
      t.string :dream_address
      t.string :password_digest
      t.timestamps
    end
  end
end
