class Workout < ActiveRecord::Base
  attr_accessible :creator_id, :due_date, :notes, :snooze_count, :status, :title, :user_id, :user_interest_rating, :user_toughness_rating, :completion_date
  belongs_to :user
  belongs_to :creator, class_name: "User"
  has_many :activities, order: :position
  has_many :components, through: :activities
  has_many :weight_records, through: :components
  has_many :exercises, through: :components


  def clone_to_constructor(new_creator_id)
    copy = self.dup
    copy.user_id = nil
    copy.creator_id = new_creator_id
    copy.status = "under_construction"
    copy.due_date = nil
    copy.snooze_count = 0
    copy.title = "Copy of #{self.title}"
    copy.user_interest_rating = nil
    copy.user_toughness_rating = nil
    copy.save!

    self.activities.each do |activity|
      activity_copy = activity.dup
      activity_copy.workout_id = copy.id
      activity_copy.save!

      activity.components.each do |component|
        component_copy = component.dup
        component_copy.activity_id = activity_copy.id
        component_copy.notes = nil
        component_copy.save!
      end
    end



  def update_personal_bests
    hash = self.user.weight_records.select{|record| self.exercises.include?(record.exercise) }.group_by{|record| record.exercise}
    hash.each do |key, value|
      pb = PersonalBest.find_or_create_by_exercise_id_and_user_id(key.id, self.user_id)
      pb.weight = value.map {|wr| wr.weight_unit == "kg" ? wr.weight : wr.weight/WeightRecord::RATIO_OF_POUNDS_TO_KILOS}.max
      pb.weight_unit = "kg"
      pb.save
    end
 end

   def mark_completed
    self.status = "complete"
    (self.completion_date ||= Time.now)
    self.save!
    self.update_personal_bests
  end

  def mark_uncompleted
    self.status = "released"
    self.save!
  end

  def release
    self.status = "released"
    self.save!
  end

  def make_under_construction
    self.status = "under_construction"
    self.save!
  end
end



 end