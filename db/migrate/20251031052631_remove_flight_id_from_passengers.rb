class RemoveFlightIdFromPassengers < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :passengers, :flights
    remove_column :passengers, :flight_id, :integer
  end
end
