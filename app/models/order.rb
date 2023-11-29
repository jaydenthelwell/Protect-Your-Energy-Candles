class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :candles, through: :line_items
  validates :order_number, presence: true, uniqueness: true
  validates :order_date, presence: true
  validates :total_amount, numericality: { greater_than_or_equal_to: 0 }

  delegate :first_name, :last_name, :email, to: :user, prefix: true
  scope :in_progress, -> { where(status: 'in_progress') }
end
