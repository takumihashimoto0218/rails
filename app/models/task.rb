class Task < ApplicationRecord
  belongs_to :list, optional: true
  belongs_to :pack, optional: true
  accepts_nested_attributes_for :list, update_only: true
  validates :title, presence: true, length: {maximum: 50}
  validates :body, length: {maximum: 1800}
  # validates :difficulty_level, presence: true, length: {maximum: 5}  まだ実装していないためコメントアウト
end
