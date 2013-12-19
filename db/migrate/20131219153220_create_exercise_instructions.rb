class CreateExerciseInstructions < ActiveRecord::Migration
  def change
    create_table :exercise_instructions do |t|
      t.integer :user_id
      t.integer :exercise_id
      t.text :description

      t.timestamps
    end
  end
end
