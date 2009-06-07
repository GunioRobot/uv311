class CreateServiceTypeAttributes < ActiveRecord::Migration
  def self.up
    create_table :service_type_attributes do |t|
      t.string :id_311
      t.string :service_type
      t.string :service_code
      t.string :name
      t.text   :prompt
      t.boolean :required
      t.string :type
      t.integer :width
      t.text   :item_list
      t.timestamps
    end
  end

  def self.down
    drop_table :service_type_attributes
  end
end
