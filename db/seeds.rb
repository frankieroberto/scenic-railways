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


Route.create(:start_station => 1, :end_station =>2)
Route.create(:start_station => 2, :end_station =>3)
Route.create(:start_station => 3, :end_station =>4)
Route.create(:start_station => 4, :end_station =>5)
Route.create(:start_station => 5, :end_station =>6)
Route.create(:start_station => 6, :end_station =>7)
