class Poi < ActiveRecord::Base
  attr_accessible :category, :description, :lat, :lng, :name
end
