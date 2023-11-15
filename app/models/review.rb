class Review < ApplicationRecord
  validates :rating, :description, presence: true
  belongs_to :candles
  belongs_to :user
end
