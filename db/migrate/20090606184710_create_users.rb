class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.integer :login_count
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.string :last_login_ip
      t.string :current_login_ip
      t.string :perishable_token, :string, :default => "", :null => false
      t.timestamps
    end
    add_index :users, :persistence_token
    add_index :users, :perishable_token
    add_index :users, :email, :unique => true
  end

  def self.down
   remove_index :users, :perishable_token
   remove_index :users, :persistence_token
   remove_index :users, :email
   drop_table :users
  end
end
