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
    # @booking = Booking.new(booking_params)
    if @booking.save!
      redirect_to root_path
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
    params.require(:booking).permit(:board_id, :user_id, :start_date, :end_date)
  end
end
