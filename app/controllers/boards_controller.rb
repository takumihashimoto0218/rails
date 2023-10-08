class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :set_topic, only: [:new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.board_new(@pack,@topic_json)
  end

  def create
    @board = Board.new(board_params.merge(user_id: current_user.id))
    if @board.save
      redirect_to boards_path, notice: 'ボードが投稿されました'
    else
      flash.now[:alert] = @board.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board), notice: "ボードを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, notice: 'ボードを削除しました'
  end

  def update_task_order
    tasks = params[:tasks]
    tasks.each do |task_data|
      task = Task.find(task_data[:id])
      task.update(position: task_data[:position])
    end
    render json: { message: 'タスクの位置を更新しました。' }
  end

  private
  def board_params
    params.require(:board).permit(:title, :body, lists_attributes: [:id,:title,:_destroy,
      tasks_attributes: [:id,:title, :body, :diffculty_level, :is_solo,:_destroy, :position]
    ]).merge(user_id: current_user.id)
  end
  

  def set_board
    @board = Board.find(params[:id])
  end

  def set_topic
    @pack = Pack.find_by(id: params[:pack_id])
    return if @pack.nil?
    @topic_json = PackWrapper.fetch_topics(@pack) rescue flash[:alert] = "エラーが発生しました"
  end

  def correct_user
    unless @board.user_id == current_user.id
      flash[:alert] = "アクセス権限がありません。"
      redirect_to boards_path
    end
  end
end
