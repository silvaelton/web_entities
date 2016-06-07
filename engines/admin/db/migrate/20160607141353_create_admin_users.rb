class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      
      t.string :first_name
      t.string :last_name
      t.string :email 
      t.string :password_digest
      t.integer :situation, default: 0
      t.integer :permission, default: 0

      t.timestamps null: false
    end
  end
end


