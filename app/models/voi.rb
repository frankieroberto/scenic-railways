class Voi < ActiveRecord::Base
  attr_accessible :lat, :left_side, :lng, :metres_from, :note, :poi_id, :route_id

  belongs_to :poi
  belongs_to :route

end
