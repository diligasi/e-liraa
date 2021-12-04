class LarvaSpecy < ApplicationRecord
  has_many :larvas

  validates :name, presence: true, uniqueness: true

  scope :species_by_region_per_range, lambda { |condition|
    joins(larvas: [test_tube: [field_form: [user: [region: [:department]]]]])
      .where(condition)
      .group('larva_species.name, regions.name')
      .select('larva_species.name as "specie", regions.name as "region", count(regions.name)')
      .order('regions.name, larva_species.name')
  }
end
