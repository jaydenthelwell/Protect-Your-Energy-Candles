class Candle < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  validates :name, :scent, :size, :date_made, :description, presence: true
  validates :stock, :price, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :edition
  has_many :line_items
  has_many :orders, through: :line_items
  has_many :images, dependent: :destroy

  validates :images, length: { is: 3 }

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
end
