class RemoveAirportColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :airports, :id
    remove_column :airports, :code
  end
end
