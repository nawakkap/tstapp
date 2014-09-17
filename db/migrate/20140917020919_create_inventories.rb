class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :product_id
      t.string :code
      t.integer :inventory

      t.timestamps
    end
  end
end
