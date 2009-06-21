class AlterTableIssuesAddColumnErviceRequest < ActiveRecord::Migration
  def self.up
    add_column :issues, :service_request, :string, :null => "false"
  end

  def self.down
    remove_column :issues, :service_request
  end
end
