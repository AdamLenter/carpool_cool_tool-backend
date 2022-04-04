class CreateUserAccountsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :user_acounts do |t|
      t.integer :user_id
      t.float :inflow_amount
      t.float :outflow_amount
      t.integer :carpool_guest_id
      t.integer :bank_account_id
    end
  end
end
