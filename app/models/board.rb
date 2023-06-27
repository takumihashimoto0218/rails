class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  accepts_nested_attributes_for :lists
  validates :title, presence: true, length: {maximum: 30}
  validates :body, length: {maximum: 1000}
end
