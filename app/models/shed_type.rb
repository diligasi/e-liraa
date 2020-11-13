class ShedType < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
