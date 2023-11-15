class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :first_name, :second_name, :d_o_b, :phone_number, :address, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, format: { with: /\A\d{10}\z/, message: "Must be a 11-digit number" }, allow_blank: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
  validates :address, allow_blank: true
  validates :credit_card_number, credit_card_number: true, allow_blank: true

  enum role: [:customer, :admin]

  has_many :orders
end
