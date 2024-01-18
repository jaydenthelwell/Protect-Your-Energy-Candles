class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :d_o_b, presence: true
  validates :email, presence: true
  validates :address, presence: true, allow_blank: true
  validates :password, presence: true, length: { minimum: 8 }

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
