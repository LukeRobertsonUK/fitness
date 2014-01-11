class WeightRecord < ActiveRecord::Base
  attr_accessible :component_id, :weight, :weight_unit
  belongs_to :component
  has_one :exercise, through: :component
  default_scope order('id ASC')
  RATIO_OF_POUNDS_TO_KILOS = 2.20462



end

