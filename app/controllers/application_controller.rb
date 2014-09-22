class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def refreshAll
    refreshInventoryLegacy
    refreshBacklogLegacy
    refreshScheduleLegacy
    
    flash[:notice]= "Refresh All Successfully"
    redirect_to backlogs_path
  end
  
  private
    def refreshInventoryLegacy
      #Getting Updated Data from LegacyInventory
      ActiveRecord::Base.connection.execute("TRUNCATE inventories")
      @legacyInventories = LegacyInventory.all
      @legacyInventories.each do |legacyInventory|
        Inventory.create(:code => legacyInventory.productCode, 
                         :inventory => legacyInventory.inventory,
                         :product_id => Product.find_by_code(legacyInventory.productCode).id)
      end
    end
    
    def refreshBacklogLegacy
      #Getting Updated Data from LegacyBacklog
      ActiveRecord::Base.connection.execute("TRUNCATE backlogs")
      @legacyBacklogs = LegacyBacklog.all
      @legacyBacklogs.each do |legacyBacklog|
        Backlog.create(:custname => legacyBacklog.custname, 
                         :product_id => Product.find_by_code(legacyBacklog.productCode).id,
                         :productCode => legacyBacklog.productCode,
                         :sono => legacyBacklog.sono,
                         :orderDate => legacyBacklog.orderDate,
                         :orderAmt => legacyBacklog.orderAmt,
                         :backlog => legacyBacklog.backlog)
      end
    end
    
    def refreshScheduleLegacy
      #Getting Updated Data from LegacySchedule
      refreshBacklogLegacy
      
      ActiveRecord::Base.connection.execute("TRUNCATE schedules")
      @legacySchedules = LegacySchedule.all
      @legacySchedules.each do |legacySchedule|
        tmpBacklog = Backlog.find_by sono:legacySchedule.sono , productCode:legacySchedule.productCode
        if tmpBacklog
          Schedule.create(:backlog_id => tmpBacklog.id,
                        :sono => legacySchedule.sono,
                        :productCode => legacySchedule.productCode,
                        :deliveryDate => legacySchedule.deliveryDate,
                        :priority => legacySchedule.priority,
                        :amt => legacySchedule.amt,
                        :seq => legacySchedule.seq,
                        :scheduler => legacySchedule.scheduler)
        end
      end
    end
    

end
