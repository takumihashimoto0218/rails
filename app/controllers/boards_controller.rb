class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
    boards = @board.lists.build
    boards.tasks.build
  end

  def create
    @board = Board.new(board_params)
    if @board.save!
      redirect_to boards_path, notice: 'Board was successfully created.'
    else
      render :new
    end
  end

  private
    def board_params
      params.require(:board).permit(:title, :body,lists_attributes: [:title, 
        tasks_attributes: [:title, :body, :diffculty_level, :is_solo]
        ]
      )
    end
end
