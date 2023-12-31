class BoardsController < ApplicationController
  include Pagy::Backend
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :set_topic, only: [:new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_q, only: [:index]

  def index
    @boards = @q.result(distinct: true)
    pagy_params = params[:q].present? ? params[:q].permit!.to_h : {}
    @pagy, @boards = pagy(@boards, items: 6, params: pagy_params)
  end

  def show
  end

  def new
    @board = Board.board_new(@pack, @topic_json)
  end

  def create
    @board = Board.new(board_params)
    if user_signed_in?
      @board.user_id = current_user.id
    end

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

  def set_q
    @q = Board.ransack(params[:q])
  end

  def board_params
    params.require(:board).permit(:title, lists_attributes: [:id, :title, :_destroy,
      tasks_attributes: [:id, :title, :body, :diffculty_level, :is_solo, :_destroy, :position]
    ])
  end

  def set_board
    @board = Board.find_by_hashid(params[:id]) || Board.find(params[:id])
    unless valid_hashid?(params[:id])
      flash[:alert] = "アクセス権限がありません。"
      redirect_to boards_path and return
    end
  end

  def valid_hashid?(id)
    Board.find_by_hashid(id).present?
  end

  def set_topic
    @pack = Pack.find_by(id: params[:pack_id])
    return if @pack.nil?
    @topic_json = PackWrapper.fetch_topics(@pack) rescue flash[:alert] = "エラーが発生しました"
  end

  def correct_user
    if @board.user_id && @board.user_id != current_user&.id
      flash[:alert] = "アクセス権限がありません。"
      redirect_to boards_path
    end
  end
end