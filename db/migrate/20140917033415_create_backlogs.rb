class CreateBacklogs < ActiveRecord::Migration
  def change
    create_table :backlogs do |t|
      t.string :custname
      t.integer :product_id
      t.string :productCode
      t.string :sono
      t.date :orderDate
      t.integer :orderAmt
      t.integer :backlog

      t.timestamps
    end
  end
end
