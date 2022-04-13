class CarpoolGuest < ActiveRecord::Base
    belongs_to :carpool
    belongs_to :user
    has_many :user_transactions
end