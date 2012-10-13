class Route < ActiveRecord::Base
  belongs_to :start_station, :class_name => 'Station'
  belongs_to :end_station, :class_name => 'Station'
  has_many :vois
  attr_accessible :end_station_id, :start_station_id

  def short_name
    start_station.name + " - " + end_station.name
  end

end