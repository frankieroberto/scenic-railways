class ScenicRoute < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :scenic_route_parts

  def as_json(options={})

    # This sets default options which are overriden if otherwise specified.

    default_options = {
      :include => {
        :scenic_route_parts => {
          :only => [:order],
          :include => {
            :route => {
              :only => [],
              :include => [:start_station, :vois => {:include => :poi}]
            }
          }
        }
      }
    }

    super(default_options)
  end

end
