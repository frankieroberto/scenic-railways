class Route < ActiveRecord::Base
  belongs_to :start_station, :class_name => 'Station'
  belongs_to :end_station, :class_name => 'Station'
  attr_accessible :end_station_id, :start_station_id
end