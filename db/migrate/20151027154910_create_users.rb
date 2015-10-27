class CreateUsers < ActiveRecord::Migration
  def change
      create_table :users do |t|
        t.string :user_full_name, null: false, limit: 100
        t.string :user_email, null: false, uniqueness: true, limit: 100
        t.string :user_password, null: false, limit: 100
        t.string :self_description
        
        t.timestamps null: false
      end
      
    add_index :users, :user_email, unique: true    
  end
end