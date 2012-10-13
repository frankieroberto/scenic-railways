class CreateScenicRoutes < ActiveRecord::Migration
  def change
    create_table :scenic_routes do |t|
      t.string :name, :null => false
      t.text :description

      t.timestamps
    end
  end
end
