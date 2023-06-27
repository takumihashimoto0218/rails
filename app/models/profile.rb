class Profile < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {maximum: 30}
  validates :self_introduction, length: {maximum: 1000}
end
