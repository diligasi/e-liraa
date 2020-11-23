class LarvaSpecy < ApplicationRecord
  has_many :larvas

  validates :name, presence: true, uniqueness: true
end
