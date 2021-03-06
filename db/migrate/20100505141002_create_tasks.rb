class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.date :due
      t.boolean :completed, :default => :false
      t.boolean :currentweek
      t.timestamps
    end
  end
  
  def self.down
    drop_table :tasks
  end
end
