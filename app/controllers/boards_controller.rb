class BoardsController < ApplicationController

  def home
    @boards = Board.all
  end

  def index
    @boards = Board.where.not(latitude: nil, longitude: nil)

    @markers = @boards.map do |board|
      {
        lat: board.latitude,
        lng: board.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end

    if params[:query].present?
      @boards = Board.where(category: params[:query])
    else
      @boards = Board.all
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(boards_params)
    @board.user = current_user
    if @board.save
      redirect_to root_path
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
    params.require(:board).permit(:name, :description, :category, :price, :location, :user_id, :photo)
  end

end
