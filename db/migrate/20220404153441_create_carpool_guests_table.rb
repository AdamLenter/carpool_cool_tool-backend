class CreateCarpoolGuestsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :carpool_guest do |t|
      t.integer :carpool_id
      t.integer :user_id
    end
  end
end
