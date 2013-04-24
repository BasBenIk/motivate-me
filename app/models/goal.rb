class Goal < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  attr_accessible :description, :reward, :title
  has_many :users, :through => :groups
  belongs_to :groups
end
