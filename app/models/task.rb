class Task < ApplicationRecord
  belongs_to :list, optional: true
  accepts_nested_attributes_for :list
end
