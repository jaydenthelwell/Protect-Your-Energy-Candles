class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :d_o_b, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "Must be a 11-digit number" }, allow_blank: true
  validates :address, presence: true, allow_blank: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 8 }
  # validates :credit_card_number, credit_card_number: true, allow_blank: true

  enum role: [:customer, :admin]

  has_many :orders
end
