class Goal < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  attr_accessible :description, :reward, :title, :endtime
  has_many :users, :through => :group
  has_many :completions
  belongs_to :group

  def complete(user)
    completions.map{|c| c.user == user}.include?(true)
  end
end
