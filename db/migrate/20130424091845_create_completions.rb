class CreateCompletions < ActiveRecord::Migration
  def self.up
    create_table :completions do |t|
      t.integer :user_id
      t.integer :goal_id
      t.timestamps
    end
  end

  def self.down
    drop_table :completions
  end
end