class AlterTableServiceTypeAttributesAddColumns < ActiveRecord::Migration
  def self.up
    add_column :service_type_attributes, :service_code, :string
  end

  def self.down
    remove_column :service_type_attributes, :service_code
  end
end
