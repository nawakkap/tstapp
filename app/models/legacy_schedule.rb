class LegacySchedule < ActiveRecord::Base
  establish_connection :tssapp
  self.table_name = :imp_rpt_production_priority
  
  alias_attribute :productCode, :product_dtl_id
  alias_attribute :deliveryDate, :delivery_date
  alias_attribute :amt, :item
  alias_attribute :scheduler, :user
  alias_attribute :seq, :ranking
end
