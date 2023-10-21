class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: [:create, :destroy]

  def index
    favorites = Favorite.where(user_id: current_user.id).pluck(:board_id)
    @favorite_boards = Board.find(favorites)
  end

  def create
    @favorite = @board.favorites.build(user: current_user)
    if @favorite.save
      respond_to do |format|
        format.html { redirect_to boards_path }
        format.js
      end
    end
  end

  def destroy
    @favorite = @board.favorites.find_by(user: current_user)
    if @favorite.destroy
      respond_to do |format|
        format.html { redirect_to boards_path }
        format.js
      end
    end
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end
end
