class PropertyType < ApplicationRecord
  has_one :field_form

  validates :name, presence: true, uniqueness: true
end
