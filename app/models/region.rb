class Region < ApplicationRecord
  belongs_to :department

  has_many :users

  validates :name, presence: true, uniqueness: { scope: :department }

  def number_of_active_users
    users.where(users: { status: true }).size
  end
end
