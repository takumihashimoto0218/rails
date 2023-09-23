
class List < ApplicationRecord
  has_many :tasks, class_name: 'Task', dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
  belongs_to :board, optional: true 
  validates :title, presence: true, length: {maximum: 30}
end
