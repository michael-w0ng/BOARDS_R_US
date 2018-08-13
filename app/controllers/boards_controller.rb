class BoardsController < ApplicationController

  def home
    @boards = Board.all
  end

  def index
    @boards = Board.all

  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(boards_params)
    if @board.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  def update

  end

  def edit

  end

  def destroy

  end

  private

  def boards_params
    params.require(:board).permit(:name, :description, :category, :price, :location, :user_id)
  end

end
