class Alterdueintasks < ActiveRecord::Migration
  def self.up
    _column :alterdueintasks, :due
  end

  def self.down
    add_column :alterdueintasks, :due
  end
end
