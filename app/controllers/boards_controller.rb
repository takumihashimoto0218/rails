class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
    # @list = List.new
    # @task = Task.new
    boards = @board.lists.build
    boards.tasks.build
  end

  def create
    @board = Board.new(board_params)
    # @list = List.new(list_params)
    # @task = Task.new(task_params)
    if @board.save!
      # @list.save!
      # if @list.save!
      #   @task.save!
      # end
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

    # def list_params
    #   params.require(:board).permit(list:[:title])
    # end

    # def task_params
    #   params.require(:board).permit(task:[:title, :body, :diffculty_level, :is_solo])
    # end
end
