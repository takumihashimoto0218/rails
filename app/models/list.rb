class List < ApplicationRecord
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks
  belongs_to :board
end
