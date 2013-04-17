class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.text :description
      t.string :reward

      t.timestamps

      create_table :groups_users, :id => false do |t|
        t.references :group, :user
      end

      add_index :groups_users, [:group_id, :user_id]

    end
  end
end
