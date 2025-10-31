class RenameFlightsIdToFlightIdInBookings < ActiveRecord::Migration[8.0]
  def change
    rename_column :bookings, :flights_id, :flight_id
  end
end
