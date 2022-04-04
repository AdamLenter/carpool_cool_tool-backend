class CreateUsersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :cellphone_number
      t.integer :home_neighborhood_location_id
      t.string :has_car
      t.integer :car_guest_capacity
    end
  end
end
