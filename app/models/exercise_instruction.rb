class ExerciseInstruction < ActiveRecord::Base
  attr_accessible :description, :exercise_id, :user_id
  belongs_to :user
  belongs_to :exercise
  validates_uniqueness_of :exercise_id, scope: [:user_id]
end
