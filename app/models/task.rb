class Task < ActiveRecord::Base
  attr_accessible :name, :due, :completed, :currentweek, :daydue  
  validates :name, :presence => true
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"

  acts_as_tree  

  scope :completed, where(:completed => true) 
  scope :incomplete, where(:completed => false) 
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
    if Time.now.to_date.cweek == self.due.to_date.cweek then
      self.currentweek = true
    end
    self.daydue = self.due.to_date.cwday
  }
  
  def after_find
      if Time.now.to_date.cweek == self.due.to_date.cweek then
        self.currentweek = true
      else
        self.currentweek = false
      end
      self.save
  end


end
