class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :trainer_id
      t.integer :trainee_id
      t.boolean :confirmed

      t.timestamps
    end
  end
end
