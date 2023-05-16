class Task < ApplicationRecord
  belongs_to :list, optional: true
  accepts_nested_attributes_for :list, update_only: true
  validates :title, presence: true, length: {maximum: 15}
  validates :body, length: {maximum: 1800}
  # validates :difficulty_level, presence: true, length: {maximum: 5}  まだ実装していないためコメントアウト
end
