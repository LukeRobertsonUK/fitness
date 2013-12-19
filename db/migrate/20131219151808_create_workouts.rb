class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.integer :creator_id
      t.string :status
      t.date :due_date
      t.integer :snooze_count
      t.string :title
      t.text :notes
      t.integer :user_interest_rating
      t.integer :user_toughness_rating

      t.timestamps
    end
  end
end
