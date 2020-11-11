class Departament < ApplicationRecord
  has_many :users

  validates :name, presence: true, uniqueness: true

  def number_of_active_users
    users.where(users: { status: true }).size
  end
end
