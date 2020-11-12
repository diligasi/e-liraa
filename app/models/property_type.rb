class PropertyType < ApplicationRecord
  has_one :filed_form

  validates :name, presence: true, uniqueness: true
end
