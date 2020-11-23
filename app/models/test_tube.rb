class TestTube < ApplicationRecord
  belongs_to :shed_type, optional: true
  belongs_to :field_form

  has_many :larvas

  alias_attribute :analyzes, :larvas

  validates :code,             presence: true, uniqueness: true
  validates :collected_amount, numericality: { greater_than: 0 }
end
