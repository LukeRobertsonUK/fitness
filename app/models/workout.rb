class Workout < ActiveRecord::Base
  attr_accessible :creator_id, :due_date, :notes, :snooze_count, :status, :title, :user_id, :user_interest_rating, :user_toughness_rating
end
