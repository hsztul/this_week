class RemoveDueFromTasks < ActiveRecord::Migration
  def self.up
    remove_column :tasks, :due
  end

  def self.down
    add_column :tasks, :due, :datetime
  end
end
