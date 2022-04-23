class User < ActiveRecord::Base
    has_many :bank_accounts
    belongs_to :city 
    belongs_to :home_neighborhood_location, :class_name => 'Location'
    has_many :carpools_as_driver, :foreign_key => 'driver_user_id', :class_name => 'Carpool'
    has_many :carpool_guests
    has_many :carpools_as_guest, :through => :carpool_guests, :source => 'carpool'
    has_many :user_transactions, :foreign_key => 'sender_user_id'
    has_many :user_transactions, :foreign_key => 'recipient_user_id'
end