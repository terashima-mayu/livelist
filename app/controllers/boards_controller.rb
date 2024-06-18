class BoardsController < ApplicationController
  def index
    @boards = current_user.boards.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path
    else
      logger.error("Failed to save board: #{board_params.inspect}, Errors: #{@board.errors}")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def board_params
    params.require(:board).permit(:date_and_time, :artist, :venue, :name, :image, :doors_open_time, :show_start_time)
  end
end
