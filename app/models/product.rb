class Product < ActiveRecord::Base
    has_one :inventory
    has_many :backlogs
    
    def sumBacklog
        self.backlogs.sum(:backlog)
    end
    
    def stock
        self.inventory.inventory
    end
end
