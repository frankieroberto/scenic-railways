class CreatePois < ActiveRecord::Migration
  def change
    create_table :pois do |t|
      t.string :name
      t.text :description
      t.float :lat
      t.float :lng
      t.string :category

      t.timestamps
    end
  end
end
