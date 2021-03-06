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
  
  def schedulesKey
    schedulesKeyList = ""
    self.schedules.each_with_index do |sch, index|
      schedulesKeyList = schedulesKeyList + sch.id.to_s + ","
    end
    
    schedulesKeyList.chomp(',')
  end
  
  def weightBacklog
    self.backlog * self.product.estWeight
  end
  
  def deliveryDate
    if self.schedules.first then
      self.schedules.first.deliveryDate
    else
      ""
    end
  end
end
