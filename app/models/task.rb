class Task < ActiveRecord::Base
  attr_accessible :name, :due, :completed, :currentweek
  scope :completed, where(:completed => true) 
  scope :incomplete, where(:completed => false) 
  scope :thisweek, where(:currentweek => true)
  scope :notthisweek, where(:currentweek => nil)
  
  before_save{
    if Time.now.to_date.cweek == self.due.cweek then
      self.currentweek = true
    end
  }

end
