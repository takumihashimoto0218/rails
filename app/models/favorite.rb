class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :board
  validates :board_id, uniqueness: { scope: :user_id }

  def self.ransackable_attributes(auth_object = nil)
    super + ['board_title']
  end

  def self.ransackable_associations(auth_object = nil)
    super + ['board']
  end

  def self.ransackable_scopes(auth_object = nil)
    %i[search_board_title]
  end

  scope :search_board_title, ->(title) {
    joins(:board).where('boards.title LIKE ?', "%#{title}%")
  }
end

