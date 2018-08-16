class BookingsController < ApplicationController

  def index
    @user = current_user
    @bookings = Booking.all.where(params[:user_id] == @user.id )
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @board = Board.find(params[:board_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.board = Board.find(params[:board_id])
    @booking.user = current_user

    @start_date = @booking.start_date
    @end_date = @booking.end_date

    found = false

    @all_bookings = Booking.all.where(params[:id] == @booking.board_id)
    @all_bookings.each do |booking|
      arrival = booking.start_date
      departure = booking.end_date
      if @start_date.between?(arrival, departure) || @end_date.between?(arrival, departure)
        found = true
      end
    end
    # @booking = Booking.new(booking_params)
    if found == true
      redirect_to new_board_booking_path, notice: "This board is already booked in the requested period"
    else
      @booking.save!
      redirect_to bookings_path, notice: "You have successfully booked this board!!"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:board_id, :user_id, :start_date, :end_date)
  end
end
