class Address < ApplicationRecord
  belongs_to :user
  attribute :primary, :boolean, default: false

  validates :first_name, :last_name, :street, :city, :county, :postcode, :phone_number, presence: true

  scope :primary_address, -> { where(primary: true) }
end
