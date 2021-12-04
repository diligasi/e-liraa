class TestTube < ApplicationRecord
  belongs_to :shed_type, optional: true
  belongs_to :field_form

  has_many :larvas

  alias_attribute :analyzes, :larvas

  validates :code,             presence: true, uniqueness: true
  validates :collected_amount, numericality: { greater_than: 0 }

  scope :total_larvae_per_region_range, lambda { |condition|
    joins(field_form: [user: [region: [:department]]])
      .where(condition)
      .group('regions.name')
      .select('regions.name as "region", sum(test_tubes.collected_amount)')
      .order('regions.name')
  }
end
