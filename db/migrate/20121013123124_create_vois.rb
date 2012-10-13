class CreateVois < ActiveRecord::Migration
  def change
    create_table :vois do |t|
      t.integer :route_id , :null => false
      t.integer :poi_id , :null => false
      t.boolean :left_side , :null => false
      t.integer :metres_from
      t.float :lat, :null =>false
      t.float :lng, :null => false
      t.text :note

      t.timestamps
    end
  end
end
