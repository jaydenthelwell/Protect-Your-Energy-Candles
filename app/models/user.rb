class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :d_o_b, presence: true
  # validates :phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "Must be a 11-digit number" }, allow_blank: true
  validates :address, presence: true, allow_blank: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 8 }

  # validates :credit_card_number, credit_card_number: true, allow_blank: true

  enum role: [:customer, :admin]

  has_many :orders
  has_many :candles
  has_many :addresses, dependent: :destroy

  def primary_address
    addresses.primary_address.first
  end

  def set_primary_address(address)
    addresses.update_all(primary: false)
    address.update(primary: true)
  end

  def current_order
    orders.in_progress.first_or_create
  end
end
