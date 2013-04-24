class CreateGoalsGroupsRelation < ActiveRecord::Migration
  def change
    create_table :goals_groups, :id => false do |t|
      t.references :goal, :group
    end

    add_index :goals_groups, [:goal_id, :group_id]
  end
end
