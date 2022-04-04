class CreateLocationsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do|t|
      t.string :name
      t.integer :city_id
      t.string :location_type
    end
  end
end
