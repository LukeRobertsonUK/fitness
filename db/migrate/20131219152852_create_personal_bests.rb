class CreatePersonalBests < ActiveRecord::Migration
  def change
    create_table :personal_bests do |t|
      t.integer :user_id
      t.integer :exercise_id
      t.float :weight
      t.string :weight_unit

      t.timestamps
    end
  end
end
