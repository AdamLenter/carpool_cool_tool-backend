class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/users" do
    users = User.all
    users.to_json
  end

  get "/cities" do
    cities = City.all.order("name")
    cities.to_json
  end

  get "/neighborhoods" do
    locations = Location.where(location_type: "Neighborhood").order("name")
    locations.to_json(include: :city)
  end

  get "/locations" do
    locations = Location.all;
    locations.to_json(include: :city)
  end

  post '/users' do 
    user = User.create(
      first_name: params[:firstName], 
      last_name: params[:lastName], 
      username: params[:username], 
      address1: params[:address1], 
      address2: params[:address2],  
      city_id: params[:cityId],  
      state: params[:state], 
      zip: params[:zip], 
      cellphone_number: params[:cellphoneNumber], 
      home_neighborhood_location_id: params[:homeNeighborhoodLocationId], 
      has_car: params[:hasCar], 
      car_guest_capacity: params[:carGuestCapacity]
    )
    user.to_json
  end
  
  post '/carpools' do 
    carpool = Carpool.create(
      carpool_date: params[:date], 
      departure_time: params[:time], 
      driver_user_id: params[:driverUserID], 
      number_of_guests_available: params[:carGuestCapacity], 
      one_way_cost: params[:oneWayCost], 
      origin_location_id: params[:originLocationId], 
      destination_location_id: params[:destinationLocationId]
    )

    # puts carpool;
    carpool.to_json
  end
  
  get '/carpools_as_driver/:id' do
    carpools = Carpool.where("driver_user_id = #{params[:id]}")
    
    carpools.to_json(include: [:origin_location, :destination_location, :carpool_guests, :users, :user_transactions])
  end

  # get `/carpool_guests` do 
  #   carpool
  # end
end