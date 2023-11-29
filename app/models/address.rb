class Address < ApplicationRecord
  belongs_to :user
  attribute :default, :boolean, default: false

  validates :first_name, :last_name, :street, :city, :county, :postcode, :phone_number, presence: true
end
