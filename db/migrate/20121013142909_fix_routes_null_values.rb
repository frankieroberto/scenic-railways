class FixRoutesNullValues < ActiveRecord::Migration

  def change
    change_column :routes, :start_station_id, :integer, :null => false
    change_column :routes, :end_station_id, :integer, :null => false
  end

end
