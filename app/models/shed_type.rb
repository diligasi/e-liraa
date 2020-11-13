class ShedType < ApplicationRecord
  has_many :test_tubes

  validates :name, presence: true, uniqueness: true
end
