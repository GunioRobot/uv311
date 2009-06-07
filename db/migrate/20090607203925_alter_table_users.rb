class AlterTableUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :string, :name
    remove_column :users, :perishable_token
  end

  def self.down
    rename_column :users, :name, :string
    add_column :users, :perishable_token, :string
  end
end
