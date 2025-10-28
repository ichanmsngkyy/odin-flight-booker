# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

airport_codes = [ 'SFO', 'NYC', 'LAX', 'ATL', 'ORD', 'DFW' ]

airport_codes.each do |code|
  Airport.find_or_create_by!(airport_code: code)
end

def create_flight
  airports = Airport.all
  departure, arrival = airports.sample(2)
  start = Time.now + rand(1..5).days
  duration = rand(60..360)

  Flight.create!(departure_airport: departure, arrival_airport: arrival, start_datetime: start, duration: duration)
end

10.times do |flight|
  create_flight
end
