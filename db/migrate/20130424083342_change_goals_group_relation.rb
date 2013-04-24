class ChangeGoalsGroupRelation < ActiveRecord::Migration
  def up
    drop_table :goals_groups
    add_column :goals, :group_id, :integer
  end

  def down
    create_table :goals_groups, :id => false do |t|
      t.references :goal, :group
    end

    add_index :goals_groups, [:goal_id, :group_id]
    remove_column :goals, :group_id
  end
end
