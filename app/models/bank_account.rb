class Bank_Account < ActiveRecord::Base
    belongs_to :user
    has_many :user_transactions
end