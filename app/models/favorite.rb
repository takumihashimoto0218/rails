class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :board
  validates :board_id, uniqueness: { scope: :user_id }
end

