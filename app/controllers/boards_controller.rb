class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
    boards = @board.list.build
    boards.tasks.build
  end

  def create
    @board = Board.new(board_params)
    if @board.valid?
      @board.save!
    else
      render :new
    end
  end

  private
    def board_params
      params.require(:board).permit(:title, :body,:status,list_attributes: [:title, 
        tasks_attributes: [:title, :body, :diffculty_level, :is_solo]
        ]
      )
    end
end
