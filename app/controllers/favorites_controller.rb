class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: [:create, :destroy]

  def create
    @favorite = current_user.favorites.create(board_id: @board.id)
  end

  def destroy
    @favorite = current_user.favorites.find_by(board_id: @board.id)
    @favorite.destroy
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end
end
