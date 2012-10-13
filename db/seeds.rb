# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Station.show();
Station.create(name => "Sheffield", csr => "SHF", lat=-1.461857, lng=53.378055);
Station.create(name => "Dore", csr => "DOR", lat=-1.515238, lng=53.327561);
Station.create(name => "Grindleford", csr => "GRN", lat=-1.625817, lng=53.305531);
