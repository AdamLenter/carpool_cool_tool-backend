class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/users" do
    users = User.all
    users.to_json(:include => {:carpools_as_driver => {:include => [:origin_location, :destination_location, :driver_user]}, :carpools_as_guest => {:include => [:origin_location, :destination_location, :driver_user]}})
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

  get '/carpools_as_driver/:id' do
    carpools = Carpool.where("driver_user_id = #{params[:id]}")
    
    carpools.to_json(include: [:origin_location, :destination_location, :carpool_guests, :users, :user_transactions])
  end

  get '/carpool/:id' do
    carpool = Carpool.find(params[:id])
    
    carpool.to_json(include: [:origin_location, :destination_location, :carpool_guests, :users, :user_transactions, :driver_user])
  end

  get '/find_carpools/:user_id/:date/:origin_location_id/:destination_location_id' do 
    carpools = Carpool.where("carpool_date = '#{params[:date]}' and origin_location_id = #{params[:origin_location_id]} and destination_location_id = #{params[:destination_location_id]} and driver_user_id != #{params[:user_id]}")
    carpools.to_json(include: [:origin_location, :destination_location, :carpool_guests, :users, :user_transactions, :driver_user])
  end

  get '/user_transactions/:user_id' do 
    user_transactions = UserTransaction.where("sender_user_id == #{params[:user_id]}  or recipient_user_id == #{params[:user_id]}")
    user_transactions.to_json(include: [:sender_user, :recipient_user])
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

  post '/carpool_guests' do 
    carpool_guest = CarpoolGuest.create(
      carpool_id: params[:carpoolId], 
      user_id: params[:userId]
      )
    carpool_guest.to_json
  end
  
  post '/carpool_transactions' do 
    user_transaction = UserTransaction.create(
      sender_user_id: params[:sender_user_id], 
      transaction_amount: params[:transaction_amount], 
      carpool_guest_id: params[:carpool_guest_id], 
      recipient_user_id: params[:recipient_user_id],
      user_transaction_date: params[:user_transaction_date]
      )
      user_transaction.to_json
  end

  patch '/mark_carpool_complete/:id' do
    carpool_to_update = Carpool.find(params[:id])
    carpool_to_update.update(carpool_complete: params[:complete])
    carpool_to_update.to_json;
  end

end