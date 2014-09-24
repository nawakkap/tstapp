class Product < ActiveRecord::Base
    has_one :inventory
    has_many :backlogs
    belongs_to :machine
    
    def sumBacklog
      self.backlogs.sum(:backlog)
    end
    
    def stock
      self.inventory.inventory
    end
    
    def sumBalance
      self.stock - self.sumBacklog
    end
    
    def stockUnscheduled
      self.stock - self.sumScheduled
    end
    
    def sumScheduled
      totalScheduledAmt = 0
      
      self.backlogs.each do |bl| 
        totalScheduledAmt = totalScheduledAmt + bl.scheduledAmt
      end
      
      totalScheduledAmt
    end
    
    def sumMinsBal
      (self.sumBacklog-self.stock)/self.speed
    end
end
