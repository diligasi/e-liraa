class FieldForm < ApplicationRecord
  belongs_to :user
  belongs_to :property_type

  enum status: {
    pending: 0,
    complete: 1
  }

  enum visit_status: {
    allowed: 0,
    refused: 1,
    closed_location: 2
  }

  validates :street,       presence: true
  validates :district,     presence: true
  validates :city,         presence: true
  validates :state,        presence: true
  validates :zipcode,      presence: true
  validates :visit_status, inclusion: { in: visit_statuses.keys }
  validates :larvae_found, inclusion: { in: [true, false] }
end
