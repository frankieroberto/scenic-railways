# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Station.create(:name => "Dore", :csr => "DOR", :lat=>-1.515238, :lng=>53.327561);
Station.create(:name => "Grindleford", :csr => "GRN", :lat=>-1.625817, :lng=>53.305531);
Station.create(:name => "Sheffield", :csr => "SHF", :lat=>-1.461857, :lng=>53.378055)
Station.create(:name => "Hathersage", :csr => "HSG", :lat=>-1.651794, :lng=>53.325736)
Station.create(:name => "Bamford", :csr => "BAM", :lat=>-1.688542, :lng=>53.338862)
Station.create(:name => "Hope", :csr => "HOP", :lat=>-1.730051, :lng=>53.346208)
Station.create(:name => "Edale", :csr => "EDL", :lat=>-1.817258, :lng=>53.364773)


Route.create(:start_station_id => 1, :end_station_id =>2)
Route.create(:start_station_id => 2, :end_station_id =>3)
Route.create(:start_station_id => 3, :end_station_id =>4)
Route.create(:start_station_id => 4, :end_station_id =>5)
Route.create(:start_station_id => 5, :end_station_id =>6)
Route.create(:start_station_id => 6, :end_station_id =>7)

<Poi id: 1, name: "Totley Tunnel", description: "It's a very long tunnel", lat: 1.0, lng: 1.0, category: "Tunnel", created_at: "2012-10-13 14:43:30", updated_at: "2012-10-13 14:43:30">,

Poi.create(:name => "Win Hill", :description =>"Shapely peak", :lat =>53.36155, :lng => 1.72198, :category => "Hill")
Poi.create(:name => "Win Hill", :description =>"Shapely peak", :lat =>53.36155, :lng => 1.72198, :category => "Hill")
Poi.create(:name => "Lose Hill", :description =>"Shapely peak", :lat =>53.36525, :lng => 1.77154, :category => "Hill")

Voi.create(:lat => 53.339566, :left_side => false, :lng => -1.689345, :metres_from => 50, :poi_id => 2, :route_id => 19) 
Voi.create(:lat => 53.349507, :left_side => true, :lng => -1.737582, :metres_from => 200, :poi_id => 3, :route_id => 20) 
