class RemovePassengersIdFromBookings < ActiveRecord::Migration[8.0]
  def change
    remove_column :bookings, :passengers_id, :integer
  end
end
