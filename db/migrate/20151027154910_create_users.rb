class CreateUsers < ActiveRecord::Migration
  def change
      create_table :users do |t|
        t.string :full_name, null: false, limit: 100
        t.string :email, null: false, uniqueness: true, limit: 100
        t.string :password, null: false, limit: 100
        t.string :self_description
        
        t.timestamps null: false
      end
      
    add_index :users, :email, unique: true    
  end
end