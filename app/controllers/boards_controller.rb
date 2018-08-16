class BoardsController < ApplicationController

  def home
    @boards = Board.all
  end

  def index
    @boards = apply_filters(Board.all)
    session[:time_start] = params[:time_start]
    session[:time_end] = params[:time_end]
  end

  def show
    @board = Board.find(params[:id])

    @markers =
      [{
        lat: @board.latitude,
        lng: @board.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }]
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(boards_params)
    @board.user = current_user
    if @board.save
      redirect_to board_path(@board), notice: "You have successfully listed your board!!"
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

  def apply_filters(scope)
    starts = params[:time_start]
    ends = params[:time_end]

    if params[:query].present? && starts.present? && ends.present?
      scope = scope.joins(:bookings).where("(bookings.start_date, bookings.end_date) OVERLAPS (?, ?)", starts, ends)
      scope = Board.where.not(id: scope.pluck(:id))
    end

    scope = scope.where(category: params[:query]) if params[:query].present?
    scope
  end

  def boards_params
    params.require(:board).permit(:name, :description, :category, :price, :location, :user_id, :photo)
  end

end
