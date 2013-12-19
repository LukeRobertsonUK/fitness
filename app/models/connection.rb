class Connection < ActiveRecord::Base
  attr_accessible :confirmed, :trainee_id, :trainer_id
end
