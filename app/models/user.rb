class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :task_favorites, dependent: :destroy
  has_many :boards, dependent: :destroy

  def already_favorited?(board)
    self.favorites.exists?(board_id: board.id)
  end

  def already_task_favorited?(task)
    self.task_favorites.exists?(task_id: task.id)
  end
end

