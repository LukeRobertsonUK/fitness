class RemoveToFailureFromComponents < ActiveRecord::Migration
  def up

    remove_column :components, :to_failure

  end
end
