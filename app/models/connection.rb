class Connection < ActiveRecord::Base
  attr_accessible :confirmed, :trainee_id, :trainer_id

  belongs_to :trainer, class_name: "User"
  belongs_to :trainee, class_name: "User"

 validates_uniqueness_of :trainer_id, scope: [:trainee_id]


end
