class AlterTableIssuesAddSeverityColumn < ActiveRecord::Migration
  def self.up
    add_column :issues, :severity, :string, :default => "non-emergency", :null => "false"
  end

  def self.down
    remove_column :issues, :severity
  end
end
