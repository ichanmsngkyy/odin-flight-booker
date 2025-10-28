class FlightsController < ApplicationController
  def index
    @flight = Flights.all
  end
end
