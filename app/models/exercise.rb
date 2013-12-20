class Exercise < ActiveRecord::Base
  attr_accessible :description, :name, :creator_id
  has_many :components
  has_many :activities, through: :components
  has_many :set_records, through: :components
  has_many :personal_bests
  has_many :exercise_instructions



end
