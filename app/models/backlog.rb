class Backlog < ActiveRecord::Base
  belongs_to :product
  has_many :schedules
  
  def min
    self.backlog/self.product.speed
  end
  
  def scheduledAmt
    if self.schedules then
      self.schedules.sum(:amt)
    else
      0
    end
  end
end
