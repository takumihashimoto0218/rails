class List < ApplicationRecord
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks
  belongs_to :board, optional: true
  accepts_nested_attributes_for :board
end
