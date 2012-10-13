class ScenicRoutePart < ActiveRecord::Base
  attr_accessible :order, :route_id, :scenic_route_id

  belongs_to :route
  belongs_to :scenic_route

end
