class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  # attr_accessible :title, :body

  has_many :connections_as_trainer, class_name: "Connection", foreign_key: :trainer_id
  has_many :connections_as_trainee, class_name: "Connection", foreign_key: :trainee_id
  has_many :workouts
  has_many :workouts_as_creator, class_name: "Workout", foreign_key: :creator_id
  has_many :exercises_as_creator, class_name: "Exercise", foreign_key: :creator_id
  has_many :personal_bests
  has_many :exercise_instructions
  has_many :activities, through: :workouts
  has_many :components, through: :activities
  has_many :weight_records, through: :components

   def full_name
    "#{first_name} #{last_name}"
  end

  def is_trainer_of?(user)
    Connection.where({trainee_id: user.id, trainer_id: self.id}).any?
  end

  def trainees
    Connection.where(trainer_id: self.id).map {|connection| connection.trainee}
  end

  def trainers
    Connection.where(trainee_id: self.id).map {|connection| connection.trainer}
  end

  def personal_best(exercise)
    PersonalBest.where({user_id: self.id, exercise_id: exercise.id}).first
  end

  def exercise_notes(exercise)
    ExerciseInstruction.where({user_id: self.id, exercise_id: exercise.id}).first
  end
end
