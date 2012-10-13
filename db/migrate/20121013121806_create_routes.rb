class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :start_station_id
      t.integer :end_station_id

      t.timestamps
    end
  end
end
