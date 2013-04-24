class DropGoalsUsersTable < ActiveRecord::Migration
  def up
    drop_table :goals_users
  end

  def down
    create_table :goals_users, :id => false do |t|
      t.references :goal, :user
    end

    add_index :goals_users, [:goal_id, :user_id]
  end
end
