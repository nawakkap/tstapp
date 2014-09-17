class LegacyInventory < ActiveRecord::Base
    establish_connection :tssapp
    self.table_name = :imp_rpt_production
    
    alias_attribute :productCode, :product_display_id
end
