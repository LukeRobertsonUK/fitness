class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :workout_id
      t.integer :sets
      t.integer :rest

      t.timestamps
    end
  end
end
