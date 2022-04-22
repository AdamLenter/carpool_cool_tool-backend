class User < ActiveRecord::Base
    has_many :bank_accounts
    belongs_to :city 
    belongs_to :home_neighborhood_location, :class_name => 'Location'
    has_many :carpool_guests
    has_many :carpools_as_guest, :through => :carpool_guests, :source => 'carpool'
    has_many :carpools
    has_many :user_transactions, :class_name => 'Sender_User'
end