class AddUserTransationDate < ActiveRecord::Migration[6.1]
  def change
    add_column :user_transactions, :user_transaction_date, :date
  end
end
