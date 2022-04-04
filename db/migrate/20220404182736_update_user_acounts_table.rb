class UpdateUserAcountsTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_acounts, :user_accounts
  end
end
