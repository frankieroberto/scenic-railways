class CreateScenicRouteParts < ActiveRecord::Migration
  def change
    create_table :scenic_route_parts do |t|
      t.integer :route_id, :null => false
      t.integer :scenic_route_id, :null => false
      t.integer :order, :null => false

      t.timestamps
    end
  end
end
