class ChangeTransactionUserIdToSenderUserId < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_transactions, :user_id, :sender_user_id
  end
end
