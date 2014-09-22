class CreateInternalValues < ActiveRecord::Migration
  def change
    create_table :internal_values do |t|
      t.string :category
      t.string :name
      t.string :value
      t.integer :seq

      t.timestamps
    end
  end
end
