class Connection < ActiveRecord::Base
  attr_accessible :confirmed, :trainee_id, :trainer_id

  belongs_to :trainer, class_name: "User"
  belongs_to :trainee, class_name: "User"
end
