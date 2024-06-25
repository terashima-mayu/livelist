class BoardsController < ApplicationController
  require 'rspotify'
  RSpotify::authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
  before_action :set_board, only: [:update_setlist, :add_setlist, :edit, :destroy]

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
    if @board.setlist.present? && @board.artist.present?
      @tracks = search_spotify_tracks(@board.artist, @board.setlist)
    else
      @tracks = []
    end
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to board_path(@board)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @board.destroy!
    redirect_to boards_path
  end

  def add_setlist
    @board = current_user.boards.find(params[:id])
  end

  def update_setlist
    @board = current_user.boards.find(params[:id])
    if @board.update(setlist_params)
      redirect_to @board
    else
      render :add_setlist, status: :unprocessable_entity
    end
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:date_and_time, :artist, :venue, :name, :image, :image_cache, :doors_open_time, :show_start_time, :setlist)
  end

  def setlist_params
    params.require(:board).permit(:setlist)
  end

  def search_spotify_tracks(artist_name, setlist)
    tracks = []
    setlist.split("\n").each do |song|
      query = "#{song.strip} artist:#{artist_name.strip}"
      results = RSpotify::Track.search(query)
      
      track = results.find do |t|
        t.name.downcase.include?(song.strip.downcase) && 
        t.artists.any? { |a| a.name.downcase.include?(artist_name.downcase) }
      end
      tracks << track if track
    end
    tracks
  end
end
