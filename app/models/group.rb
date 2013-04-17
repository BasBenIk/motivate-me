class Group < ActiveRecord::Base
  attr_accessible :description, :reward, :title
  has_and_belongs_to_many :users
end
