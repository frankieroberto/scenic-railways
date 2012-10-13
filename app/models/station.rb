class Station < ActiveRecord::Base
  attr_accessible :csr, :lat, :lng, :name
end
