class Workout < ActiveRecord::Base
  attr_accessible :creator_id, :due_date, :notes, :snooze_count, :status, :title, :user_id, :user_interest_rating, :user_toughness_rating
  belongs_to :user
  belongs_to :creator, class_name: "User"
  has_many :activities, order: :position
  has_many :components, through: :activities
  has_many :weight_records, through: :components
  has_many :exercises, through: :components




  def update_personal_bests
    hash = self.user.weight_records.select{|record| self.exercises.include?(record.exercise) }.group_by{|record| record.exercise}
    hash.each do |key, value|
      pb = PersonalBest.find_or_create_by_exercise_id_and_user_id(key.id, self.user_id)
      pb.weight = value.map {|wr| wr.weight_unit == "kg" ? wr.weight : wr.weight/WeightRecord::RATIO_OF_POUNDS_TO_KILOS}.max
      pb.weight_unit = "kg"
      pb.save
    end
 end


end
