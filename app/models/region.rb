class Region < ApplicationRecord
  belongs_to :department

  validates :name, presence: true, uniqueness: { scope: :department }
end
