class Pack < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: {maximum: 30}
end
