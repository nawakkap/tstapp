class Product < ActiveRecord::Base
    has_one :inventory
    has_many :backlogs
    
    def sumBacklog
      self.backlogs.sum(:backlog)
    end
    
    def stock
      self.inventory.inventory
    end
    
    def worktime_day
      InternalValue.find_by(category: :WORKTIME , name: self.machine).value
    end
    
    def worktime_week
      self.worktime_day.to_i*7
    end
end
