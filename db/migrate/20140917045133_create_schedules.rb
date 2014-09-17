class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :backlog_id
      t.string :sono
      t.string :productCode
      t.date :deliveryDate
      t.integer :priority
      t.integer :amt
      t.integer :seq
      t.string :scheduler

      t.timestamps
    end
  end
end
