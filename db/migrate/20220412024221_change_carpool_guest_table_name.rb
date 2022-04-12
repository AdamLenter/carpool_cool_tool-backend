class ChangeCarpoolGuestTableName < ActiveRecord::Migration[6.1]
  def change
    rename_table :carpool_guest, :carpool_guests
  end
end
