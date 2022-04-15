class User < ActiveRecord::Base
    has_many :bank_accounts
    belongs_to :city 
    belongs_to :home_neighborhood_location, :class_name => 'Location'
    has_many :carpool_guests
    has_many :carpools, through: :carpool_guests
    has_many :carpools
    has_many :user_transactions, :class_name => 'Sender_User'
end