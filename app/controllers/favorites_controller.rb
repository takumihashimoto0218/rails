class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: [:create, :destroy]

  def create
    @favorite = @board.likes.build(user: current_user)
    if @favorite.save
      respond_to do |format|
        format.html { redirect_to @board }
        format.js   # create.js.erbを使用する
      end
    else
      # エラーハンドリングの処理を追加
    end
  end

  def destroy
    @favorite = @board.favorits.find_by(user: current_user)
    if @favorite.destroy
      respond_to do |format|
        format.html { redirect_to @board }
        format.js   # destroy.js.erbを使用する
      end
    end
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end
end
