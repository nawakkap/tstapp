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
      balance = self.stock - self.sumBacklog
      
      balance <= 0 ? balance.abs : 0
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
      minsBalance = (self.stock - self.sumBacklog)/self.speed
      
      minsBalance <= 0 ? minsBalance.abs : 0
    end
end
