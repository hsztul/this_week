class AddDueFromTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :due, :date
  end

  def self.down
    remove_column :tasks, :due
  end
end
