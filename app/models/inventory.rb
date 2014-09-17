class Inventory < ActiveRecord::Base
  belongs_to :product
  
  def machine
    self.product.machine
  end
  
  def speed
    self.product.speed
  end
  
  def mins
    self.inventory/self.product.speed
  end
end
