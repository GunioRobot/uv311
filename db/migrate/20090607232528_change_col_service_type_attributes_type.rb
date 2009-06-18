class ChangeColServiceTypeAttributesType < ActiveRecord::Migration
  def self.up
    rename_column :service_type_attributes, :type, :attribute_type
  end

  def self.down
    rename_column :service_type_attributes, :attribute_type, :type
  end
end
