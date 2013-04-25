class AddCompletionDateToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :completed_on, :timestamp
  end
end
