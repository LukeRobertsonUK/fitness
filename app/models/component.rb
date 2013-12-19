class Component < ActiveRecord::Base
  attr_accessible :activity_id, :distance, :distance_units, :exercise_id, :interval, :interval_units, :notes, :reps
end
