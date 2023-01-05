class Order < ApplicationRecord
	belongs_to :cart, optional: true
	belongs_to :user, optional: true
	has_many :reviews, dependent: :destroy
	def full_address
	  "#{address} #{district} #{country}-#{postal_code}"
	end
end
