class Edition < ApplicationRecord
  has_many :candles
  validates :name, presence: true

  LIGHT_EDITION_NAME = 'Light Edition'.freeze

  def self.light_edition
    find_or_create_by(name: LIGHT_EDITION_NAME)
  end

  DARK_EDITION_NAME = 'Dark Edition'.freeze

  def self.dark_edition
    find_or_create_by(name: DARK_EDITION_NAME)
  end
end
