class AddAttachmentsPictureToIssue < ActiveRecord::Migration
  def self.up
    add_column :issues, :picture_file_name, :string
    add_column :issues, :picture_content_type, :string
    add_column :issues, :picture_file_size, :integer
    add_column :issues, :picture_updated_at, :datetime
  end

  def self.down
    remove_column :issues, :picture_file_name
    remove_column :issues, :picture_content_type
    remove_column :issues, :picture_file_size
    remove_column :issues, :picture_updated_at
  end
end
