class Group < ActiveRecord::Base
  attr_accessible :description, :title, :user_ids, :owner
  has_and_belongs_to_many :users
  has_many :goals
  belongs_to :owner, :class_name => "User"
  after_save :validate_minimum_number_of_users

  def active_goals
    goals.where(:active => true).reject{|g| g.expired?}
  end

  def finished_goals
    goals.where(:active => false)
  end

private
  def validate_minimum_number_of_users
    if users.count < 1
      errors.add(:users, "must have at least one user")
      return false
    end
  end
end
