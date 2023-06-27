class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  has_many :favorites, dependent: :destroy    

  def already_favorited?(board)
    self.favorites.exists?(board_id: board.id)
  end
end
