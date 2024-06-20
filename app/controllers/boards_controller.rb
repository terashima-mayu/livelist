class BoardsController < ApplicationController
  before_action :set_board, only: [:update_setlist,:add_setlist]
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

  def show
    @board = current_user.boards.find(params[:id])
  end

  def add_setlist
    @board = current_user.boards.find(params[:id])
  end

  def update_setlist
    @board = current_user.boards.find(params[:id])
    if @board.update(setlist_params)
      redirect_to @board, notice: 'セットリストが更新されました。'
    else
      render :add_setlist, status: :unprocessable_entity
    end
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:date_and_time, :artist, :venue, :name, :image,:image_cache, :doors_open_time, :show_start_time)
  end

  def setlist_params
    params.require(:board).permit(:setlist)
  end
end
