class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable,:registerable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable

  belongs_to :department, optional: true

  has_many :field_forms

  enum role: {
    admin: 0,
    supervisor: 1,
    lab: 2,
    field: 3
  }

  validates :name,     presence: true
  validates :cpf,      presence: true, uniqueness: true
  validates :email,    presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role,     inclusion: { in: roles.keys }
  validates :status,   inclusion: { in: [true, false] }

  def active_for_authentication?
    super && status
  end
end
