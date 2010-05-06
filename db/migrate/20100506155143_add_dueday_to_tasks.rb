class AddDuedayToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :daydue, :int
  end

  def self.down
    remove_column :tasks, :daydue
  end
end
