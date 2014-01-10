class AddExerciseTypeToComponents < ActiveRecord::Migration
  def change
    add_column :components, :exercise_type, :string
  end
end
