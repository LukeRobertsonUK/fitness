class Activity < ActiveRecord::Base
  attr_accessible :rest, :sets, :workout_id
  belongs_to :workout
  has_many :components
  has_many :exercises, through: :components
end
