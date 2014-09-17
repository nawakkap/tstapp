class LegacyBacklog < ActiveRecord::Base
  establish_connection :tssapp
  self.table_name = :imp_rpt_production_xppdor
  
  alias_attribute :dataStartDate, :start_date
  alias_attribute :dataEndDate, :end_date
  alias_attribute :orderDate, :order_date
  alias_attribute :productCode, :product_dtl_id
  alias_attribute :orderAmt, :order
  alias_attribute :backlog, :order_bal
  
end
