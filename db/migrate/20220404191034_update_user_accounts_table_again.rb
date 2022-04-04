class UpdateUserAccountsTableAgain < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_accounts, :user_transactions
  end
end
