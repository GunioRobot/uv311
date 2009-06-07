class AlterTableVotesAddValueField < ActiveRecord::Migration
  def self.up
    add_column :votes, :value, :integer
  end

  def self.down
  end
end
