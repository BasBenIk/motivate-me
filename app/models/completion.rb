class Completion < ActiveRecord::Base
  attr_accessible :user_id, :goal_id
  belongs_to :user
  belongs_to :goal
end
