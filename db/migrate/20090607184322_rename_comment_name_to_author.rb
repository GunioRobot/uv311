class RenameCommentNameToAuthor < ActiveRecord::Migration
  def self.up
    rename_column :comments, :name, :author
  end

  def self.down
    rename_column :comments, :author, :name
  end
end
