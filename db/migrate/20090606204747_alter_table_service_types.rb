class AlterTableServiceTypes < ActiveRecord::Migration
  def self.up
    rename_column :service_types, :name, :service_type
    rename_column :service_types, :code, :service_code
    change_column :service_types, :service_code, :string
  end

  def self.down
  end
end
