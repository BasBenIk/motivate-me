class Goal < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  attr_accessible :description, :reward, :title
  has_and_belongs_to_many :users
end
