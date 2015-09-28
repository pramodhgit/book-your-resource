class WelcomeController < ApplicationController
  def index
  	@bookings = Booking.order("start_at").all
  	@booking = Booking.new
  end
end
