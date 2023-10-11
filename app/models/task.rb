class Task < ApplicationRecord
  belongs_to :list, class_name: 'List'
  accepts_nested_attributes_for :list, update_only: true
  validates :title, presence: true, length: {maximum: 50}
  validates :body, length: {maximum: 1800}
  acts_as_list scope: :list
  has_many :task_favorites, dependent: :destroy
end
