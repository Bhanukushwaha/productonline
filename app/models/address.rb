class Address < ApplicationRecord
	belongs_to :user,  optional: true
	def full_address
		"#{address} #{district} #{country}-#{post_code}"
	end
	validates :country, presence: true
  validates :district, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
end
