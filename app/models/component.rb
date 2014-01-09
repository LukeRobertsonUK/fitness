class Component < ActiveRecord::Base
  attr_accessible :activity_id, :distance, :distance_units, :exercise_id, :interval, :interval_units, :notes, :reps, :exercise_name, :to_failure
  belongs_to :activity
  belongs_to :exercise
  has_many :weight_records



  def exercise_name
    exercise.name if exercise
  end


  def exercise_name=(name)
    self.exercise = Exercise.find_or_create_by_name(name) unless name.blank?
  end


end
