class AddColumnToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :completion_date, :date
  end
end
