class WeightRecord < ActiveRecord::Base
  attr_accessible :component_id, :weight, :weight_unit
  belongs_to :component
end
