class CreateWeightRecords < ActiveRecord::Migration
  def change
    create_table :weight_records do |t|
      t.float :weight
      t.string :weight_unit
      t.integer :component_id

      t.timestamps
    end
  end
end
