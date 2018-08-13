class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    # @booking = Booking.new(booking_params)
    # if @booking.save!
    #   redirect_to booking_path
  end

  private

  def booking_params
    params.require(:booking).permit(:board_id, :user_id)
  end
end
