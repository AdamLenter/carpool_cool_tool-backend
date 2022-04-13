class AddUserTransactionRecipientUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :user_transactions, :recipient_user_id, :integer
  end
end
