class ChangeOutflowAmountToTransactionAmount < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_transactions, :outflow_amount, :transaction_amount
  end
end
