class Component < ActiveRecord::Base
  attr_accessible :activity_id, :distance, :distance_units, :exercise_id, :interval, :interval_units, :notes, :reps
  belongs_to :activity
  belongs_to :exercise
  has_many :weight_records
end
