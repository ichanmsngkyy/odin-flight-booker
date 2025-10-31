class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport", foreign_key: "departure_id"
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrival_id"
  has_many :bookings
  has_many :passengers

  def flight_info
    "#{departure_airport.airport_code} -> #{arrival_airport.airport_code} | " \
    "#{start_datetime.strftime('%Y-%m-%d %H:%M')} | " \
    "Duration #{duration} mins"
  end
end
