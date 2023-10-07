class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update]
  before_action :set_topic, only: [:new, :create]
  before_action :validate_security_token, only: [:show, :edit, :update, :destroy]


  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.board_new(@pack,@topic_json)
  end

  def create
    @board = Board.new(board_params)
    if @board.save!
      redirect_to boards_path, notice: 'Board was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @board.update!(board_params)
      redirect_to boards_path
    else
      render :edit
    end
  end

  def update_task_order
    task = Task.find(params[:task_id])
    if task.update(position: params[:position])
      render json: { message: 'タスクの並び替えに成功しました。' }
    else
      render json: { error: task.errors.full_messages.join(", ") }, status: 422
    end
  end

  private
    def board_params
      params.require(:board).permit(:title, :body,lists_attributes: [:id,:title,:_destroy,
        tasks_attributes: [:id,:title, :body, :diffculty_level, :is_solo,:_destroy, :position]
        ]
      )
    end

    def set_board
      @board = Board.find(params[:id])
    end

    def set_topic
      @pack = Pack.find_by(id: params[:pack_id])
      return if @pack.nil?
      begin
        @topic_json = PackWrapper.fetch_topics(@pack)
      rescue StandardError => e
        flash[:alert] = "エラーが発生しました: #{e.message}"
      end
    end

    def validate_security_token
      unless @board.security_token == params[:token]
        redirect_to boards_path, alert: '不正なアクセスです。'
      end
    end
end
