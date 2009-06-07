class EditServiceTypesAttTable < ActiveRecord::Migration
  def self.up
    remove_column :service_type_attributes, :service_type
    remove_column :service_type_attributes, :service_code
    add_column :service_type_attributes, :service_type_id, :integer
  end

  def self.down
    remove_column :service_type_attributes, :service_type_id
    add_column :service_type_attributes, :service_type, :string
    add_column :service_type_attributes, :service_code, :string
  end
end
