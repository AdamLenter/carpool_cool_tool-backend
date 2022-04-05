puts "🌱 Seeding spices..."

# Seed your database here
City.create(id: 1, name: "Port Washington")
City.create(id: 2, name: "Roslyn")
City.create(id: 3, name: "Manhasset")
City.create(id: 4, name: "New York (Manhattan)")
City.create(id: 5, name: "Brooklyn")
City.create(id: 6, name: "Queens")

Location.create(id: 1, name: "Port Washington Train Station", city_id: 1, location_type: "Transit")
Location.create(id: 2, name: "Soundview", city_id: 1, location_type: "Neighborhood")
Location.create(id: 3, name: "Park Section", city_id: 1, location_type: "Neighborhood")
Location.create(id: 4, name: "Salem", city_id: 1, location_type: "Neighborhood")
Location.create(id: 5, name: "Manorhaven", city_id: 1, location_type: "Neighborhood")
Location.create(id: 6, name: "Manhasset Isle", city_id: 1, location_type: "Neighborhood")
Location.create(id: 7, name: "Port Washington North", city_id: 1, location_type: "Neighborhood")
Location.create(id: 8, name: "Roslyn Train Station", city_id: 2, location_type: "Transit")
Location.create(id: 9, name: "Roslyn", city_id: 2, location_type: "Neighborhood")
Location.create(id: 10, name: "Roslyn Estates", city_id: 2, location_type: "Neighborhood")
Location.create(id: 11, name: "Manhasset Train Station", city_id: 3, location_type: "Transit")
Location.create(id: 12, name: "Manhasset", city_id: 3, location_type: "Neighborhood")
Location.create(id: 13, name: "Munsey Park", city_id: 3, location_type: "Neighborhood")
Location.create(id: 14, name: "Plandome", city_id: 3, location_type: "Transit")
Location.create(id: 15, name: "Plandome Train Station", city_id: 3, location_type: "Transit")
Location.create(id: 16, name: "Penn Station", city_id: 4, location_type: "Transit")
Location.create(id: 17, name: "Grand Central Terminal", city_id: 4, location_type: "Transit")
Location.create(id: 18, name: "Upper East Side", city_id: 4, location_type: "Neighborhood")
Location.create(id: 19, name: "Upper West Side", city_id: 4, location_type: "Neighborhood")
Location.create(id: 20, name: "Financial District", city_id: 4, location_type: "Neighborhood")
Location.create(id: 21, name: "SoHo", city_id: 4, location_type: "Neighborhood")
Location.create(id: 22, name: "Grennwich Village", city_id: 4, location_type: "Neighborhood")
Location.create(id: 23, name: "Lower East Side", city_id: 4, location_type: "Neighborhood")
Location.create(id: 24, name: "Atlantic Terminal", city_id: 5, location_type: "Transit")
Location.create(id: 25, name: "Park Slope", city_id: 5, location_type: "Neighborhood")
Location.create(id: 26, name: "Prospect Heights", city_id: 5, location_type: "Neighborhood")
Location.create(id: 27, name: "Williamsburg", city_id: 5, location_type: "Neighborhood")
Location.create(id: 28, name: "Downtown Brooklyn", city_id: 5, location_type: "Neighborhood")
Location.create(id: 29, name: "Long Island City", city_id: 6, location_type: "Neighborhood")
Location.create(id: 30, name: "Sunnyside", city_id: 6, location_type: "Neighborhood")

count = 1
while count <= 50 do
    has_car_options = ["no", "yes"]
    has_car_choice = rand(0..1)

    has_car = has_car_options[has_car_choice]

    if(has_car_choice == 1)
        car_guest_capacity = rand(1..5)
    else
        car_guest_capacity = nil
    end

    city_id = rand(1..6)

    case city_id
    when 1
        home_neighborhood_location_id = rand(2..7)
    when 2
        home_neighborhood_location_id = rand(9..10)
    when 3
        home_neighborhood_location_id = rand(12..14)
    when 4
        home_neighborhood_location_id = rand(18..23)        
    when 5
        home_neighborhood_location_id = rand(25..28)
    when 6
        home_neighborhood_location_id = rand(29..30)
    end

    User.create(
        id: count, 
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name, 
        username: Faker::Internet.username, 
        address1: Faker::Address.street_address, 
        city_id: city_id, 
        state: "New York", 
        zip: Faker::Address.zip_code, 
        cellphone_number: Faker::PhoneNumber.cell_phone, 
        home_neighborhood_location_id: home_neighborhood_location_id, 
        has_car: has_car, 
        car_guest_capacity: car_guest_capacity
    )
    count += 1

end

puts "✅ Done seeding!"
