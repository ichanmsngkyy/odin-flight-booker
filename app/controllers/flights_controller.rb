class FlightsController < ApplicationController
  def index
    @departure_options =Airport.all.map { |a| [ a.airport_code, a.airport_code ] }
    @arrival_options = Airport.all.map { |a| [ a.airport_code, a.airport_code ] }
    @time_options =Flight.all.map { |f| f.start_datetime.to_datetime }.uniq.map do |date|
      [ date.strftime("%B %d,%Y"), date ]
    end

    departure_airport = Airport.find_by(airport_code: params[:departure_code])
    arrival_airport = Airport.find_by(airport_code: params[:arrival_code])
    date = params[:start_datetime].present? ? params[:start_datetime].to_date : nil

    if params[:departure_code].present? && params[:arrival_code].present? && params[:start_datetime].present?
      @flights_available = Flight.where(departure_id: departure_airport.id, arrival_id: arrival_airport.id).where("DATE(start_datetime) = ?", date)
    end
  end
end
