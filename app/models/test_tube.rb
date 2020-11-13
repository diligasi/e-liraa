class TestTube < ApplicationRecord
  belongs_to :shed_type, optional: true
  belongs_to :field_form

  validates :code,             presence: true, uniqueness: true
  validates :collected_amount, numericality: { greater_than: 0 }
end
