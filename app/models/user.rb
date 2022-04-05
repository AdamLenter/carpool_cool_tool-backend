class User < ActiveRecord::Base
    has_many :bank_accounts
    belongs_to :city 
    belongs_to :home_neighborhood_location, :class_name => 'Location'
    has_many :carpool_guests
end