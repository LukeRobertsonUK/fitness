class AddPositionToComponents < ActiveRecord::Migration
  def change
    add_column :components, :position, :integer
  end
end
