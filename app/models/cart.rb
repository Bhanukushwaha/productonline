class Cart < ApplicationRecord
	belongs_to :user
	has_many :orders, dependent: :destroy
	has_many :cart_items, dependent: :destroy
	def sub_total
     	cart_items.map(&:price).reject {|e| !e.present?}.sum	
	end
	 def quantity
     	cart_items.map(&:quantity).sum	
	end
end
