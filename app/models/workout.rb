class Workout < ActiveRecord::Base
  attr_accessible :creator_id, :due_date, :notes, :snooze_count, :status, :title, :user_id, :user_interest_rating, :user_toughness_rating

  belongs_to :user
  belongs_to :creator, class_name: "User"
  has_many :activities
  has_many :components, through: :activities
end
