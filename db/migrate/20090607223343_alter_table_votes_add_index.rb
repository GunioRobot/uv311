class AlterTableVotesAddIndex < ActiveRecord::Migration
  def self.up
    add_index :votes, [:user_id, :issue_id], :unique => true
  end

  def self.down
    remove_index :votes, [:user_id, :issue_id]
  end
end
