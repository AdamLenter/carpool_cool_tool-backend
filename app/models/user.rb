class User < ActiveRecord::Base
    has_many :bank_accounts
    belongs_to :city
    belongs_to :location
    has_many :carpool_guests
end