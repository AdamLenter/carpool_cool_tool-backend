class ChangeCityColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :city, :city_id
  end
end
