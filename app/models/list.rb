class List < ApplicationRecord
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
  belongs_to :board, optional: true
  accepts_nested_attributes_for :board
  validates :title, presence: true, length: {maximum: 30}
end
