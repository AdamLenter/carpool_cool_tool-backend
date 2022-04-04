class CreateCarpoolsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :carpools do |t|
      t.date :carpool_date
      t.time :departure_time
      t.integer :driver_user_id
      t.integer :number_of_guests_available
      t.float :one_way_cost
      t.integer :origin_location_id
      t.integer :destination_location_id
    end
  end
end
