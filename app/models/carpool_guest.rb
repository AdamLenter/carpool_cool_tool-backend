class CarpoolGuest < ActiveRecord::Base
    belongs_to :carpool
    belongs_to :user 
    belongs_to :user_transaction
end