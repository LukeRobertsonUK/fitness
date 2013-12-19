class PersonalBest < ActiveRecord::Base
  attr_accessible :exercise_id, :user_id, :weight, :weight_unit
  belongs_to :user
  belongs_to :exercise
end
