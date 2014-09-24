class Machine < ActiveRecord::Base
  has_many :products
  
  def totalMinsBal
    totalMinsBacklogs = 0
    
    self.products.each do |p|
      totalMinsBacklogs = totalMinsBacklogs + p.sumMinsBal
    end
    
    totalMinsBacklogs > 0 ? totalMinsBacklogs : 0
  end
  
  def totalBalUnit
    totalBal = 0
    
    self.products.each do |p|
      totalBal = totalBal + p.sumBalance
    end
    
    totalBal < 0 ? totalBal.abs : 0
  end
  
  def totalBacklogsUnit
    totalBacklogs = 0
    
    self.products.each do |p|
      totalBacklogs = totalBacklogs + p.sumBacklog
    end
    
    totalBacklogs
  end
  
  def totalScheduledUnit
    totalScheduled = 0
    
    self.products.each do |p|
      totalScheduled = totalScheduled + p.sumScheduled
    end
    
    totalScheduled
  end
  
  def mins
    self.workdays*self.workhours*60
  end
  
  def pctUsed
    self.totalMinsBal/self.mins*100
  end
  
  def pctScheduled
    self.totalScheduledUnit.to_f/self.totalBacklogsUnit.to_f*100
  end
end
