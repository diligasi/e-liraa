class Region < ApplicationRecord
  belongs_to :department

  has_many   :users

  validates :name, presence: true, uniqueness: { scope: :department }
end
