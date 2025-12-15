class PassengerMailer < ApplicationMailer
  default from: "air_kuma@gmail.com"

  def flight_confirmation(passenger)
    @passenger = passenger
    @booking = @passenger.booking

    mail(
      to: @passenger.email.strip,
      subject: "Booking Confirmation"
    )
  end
end
