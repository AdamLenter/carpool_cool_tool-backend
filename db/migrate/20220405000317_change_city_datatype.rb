class ChangeCityDatatype < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :city, :integer
  end
end
