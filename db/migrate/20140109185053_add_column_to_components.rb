class AddColumnToComponents < ActiveRecord::Migration
  def change
    add_column :components, :to_failure, :boolean
  end
end
