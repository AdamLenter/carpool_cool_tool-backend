class UserTranaction < ActiveRecord::Base
    belongs_to :carpool_guest
    belongs_to :bank_account
end