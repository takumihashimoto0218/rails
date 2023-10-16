class Profile < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {maximum: 30}
  validates :self_introduction, length: {maximum: 1000}
  has_one_attached :profile_image
end
