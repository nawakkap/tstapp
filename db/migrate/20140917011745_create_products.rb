class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.float :estWeight
      t.string :machine
      t.float :speed

      t.timestamps
    end
  end
end
