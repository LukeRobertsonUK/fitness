class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.integer :activity_id
      t.integer :exercise_id
      t.integer :reps
      t.float :distance
      t.float :interval
      t.string :distance_units
      t.string :interval_units
      t.string :notes

      t.timestamps
    end
  end
end
