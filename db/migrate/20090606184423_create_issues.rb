class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
     t.integer :user_id
     t.string :aid
     t.string :address
	   t.string :title
	   t.text :description, :limit => 1024
	   t.string :service_type_id
	   t.string :token
     t.timestamps
    end
  end

  def self.down
    drop_table :issues
  end
end
