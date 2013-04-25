class AddEndTimeToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :endtime, :datetime
  end
end
