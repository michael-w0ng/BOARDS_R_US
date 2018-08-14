class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @board = Board.find(params[:board_id])
    @booking = Booking.new
  end

  def create
    @booking.user = current_user
    @booking.board = Board.find(params[:board_id])
    @booking = Booking.new(booking_params)
    # @booking = Booking.new(booking_params)
    if @booking.save!
      redirect_to booking_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @dose.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:board_id, :user_id)
  end
end
