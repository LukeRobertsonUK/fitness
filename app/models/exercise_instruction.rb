class ExerciseInstruction < ActiveRecord::Base
  attr_accessible :description, :exercise_id, :user_id
end
