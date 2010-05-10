class Task < ActiveRecord::Base
  attr_accessible :name, :due, :completed, :currentweek, :daydue  
  validates :name, :presence => true
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  
  scope :completed, where(:completed => true) 
  scope :incomplete, where(:completed => nil) 
  scope :thisweek, where(:currentweek => true)
  scope :notthisweek, where(:currentweek => nil)
  scope :monday, where(:daydue => '1')
  scope :tuesday, where(:daydue => '2')
  scope :wednesday, where(:daydue => '3')
  scope :thursday, where(:daydue => '4')
  scope :friday, where(:daydue => '5')
  scope :saturday, where(:daydue => '6')
  scope :sunday, where(:daydue => '7')
      
  before_save{
    if Time.now.to_date.cweek == self.due.cweek then
      self.currentweek = true
    end
    self.daydue = self.due.cwday
  }

end
