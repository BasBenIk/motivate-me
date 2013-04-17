class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.string :reward

      t.timestamps
    end

    create_table :goals_users, :id => false do |t|
      t.references :goal, :user
    end

    add_index :goals_users, [:goal_id, :user_id]
  end
end
