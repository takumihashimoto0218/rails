class Pack < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: {maximum: 30}
  has_many :packdetails, dependent: :destroy
  accepts_nested_attributes_for :packdetails 
end
