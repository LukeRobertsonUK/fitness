class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :connections_as_trainer, class_name: "Connection", foreign_key: :trainer_id
  has_many :connections_as_trainee, class_name: "Connection", foreign_key: :trainee_id
  has_many :workouts
  has_many :workouts_as_creator, class_name: "Workout", foreign_key: :creator_id
  has_many :exercises_as_creator, class_name: "Exercise", foreign_key: :creator_id
  has_many :personal_bests
  has_many :exercise_instructions
  has_many :activities, through: :workouts



end
