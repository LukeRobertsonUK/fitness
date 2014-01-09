class Activity < ActiveRecord::Base
  attr_accessible :rest, :sets, :workout_id, :components_attributes
  belongs_to :workout
  has_many :components
  has_many :exercises, through: :components
  has_one :creator, through: :workout
  accepts_nested_attributes_for :components, allow_destroy: true
  acts_as_list scope: :workout




end
