class AddRestUnitsToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :rest_units, :string
  end
end
