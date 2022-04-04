class CreateBankAccountsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_accounts do |t|
      t.integer :user_id
      t.string :bank_name
      t.string :account_number
    end
  end
end
