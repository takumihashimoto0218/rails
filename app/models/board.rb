class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  accepts_nested_attributes_for :lists, reject_if: :all_blank, allow_destroy: true
  validates :title, presence: true, length: {maximum: 30}
  validates :body, length: {maximum: 1000}
  has_many :favorites, dependent: :destroy
  include Hashid::Rails
  belongs_to :user, optional: true

  def self.board_new(pack, topics)
    board = Board.new
    if pack.nil?
      list = board.lists.build
      list.tasks.build
    else
      list = board.lists.build(title: pack.title)
      topics.each do |topic|
        list.tasks.build(title: topic["title"], body: 'Default')
      end
    end
    board
  end

end