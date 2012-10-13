class ScenicRoute < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :scenic_route_parts


end
