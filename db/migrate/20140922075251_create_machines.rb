class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :name
      t.float :workdays
      t.float :workhours

      t.timestamps
    end
  end
end
