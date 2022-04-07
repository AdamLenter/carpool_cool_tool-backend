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
end