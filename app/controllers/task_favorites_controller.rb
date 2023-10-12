class TaskFavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:create, :destroy]

  def create
    @favorite = current_user.task_favorites.create(task_id: @task.id)
  end

  def destroy
    @favorite = current_user.task_favorites.find_by(task_id: @task.id)
    @favorite.destroy
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end
end
