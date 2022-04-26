class AddCarpoolCompleteField < ActiveRecord::Migration[6.1]
  def change
    add_column :carpools, :carpool_complete, :string
  end
end
