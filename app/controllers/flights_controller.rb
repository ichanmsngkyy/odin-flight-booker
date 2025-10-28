class FlightsController < ApplicationController
  def index
    @departure_options =Flight.all.map do |f |
      [ "#{f.departure_airport.airport_code}", f.id ]
    end
    @arrival_options =Flight.all.map do |f |
      [ "#{f.arrival_airport.airport_code}", f.id ]
    end
    @time_options =Flight.all.map do |f |
      [ "#{f.start_datetime.strftime("%B %d, %H:%M")}", f.id ]
    end
  end
end
