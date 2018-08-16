class ReviewsController < ApplicationController

  def index
    @board = Board.find(params[:board_id])
    @reviews = Review.all.where(params[:board_id] == @board.id )
  end

  def show
  end

  def new
    @board = Board.find(params[:board_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @board = Board.find(params[:board_id])
    @review.board = @board
    if @review.save!
      redirect_to root_path, notice: "Thanks for the review and see you soon!"
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to root_path
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :board_id)
  end
end
