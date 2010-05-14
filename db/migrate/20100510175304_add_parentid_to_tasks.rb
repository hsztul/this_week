class AddParentidToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :parent_id, :integer
  end

  def self.down
    remove_column :tasks, :parent_id
  end
end
