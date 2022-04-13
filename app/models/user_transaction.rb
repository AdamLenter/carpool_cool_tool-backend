class UserTransaction < ActiveRecord::Base
    belongs_to :carpool_guest
    belongs_to :bank_account
    belongs_to :sender_user, :class_name => 'User'
    belongs_to :carpool
end