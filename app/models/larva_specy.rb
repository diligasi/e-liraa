class LarvaSpecy < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
