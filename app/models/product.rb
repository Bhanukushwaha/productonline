class Product < ApplicationRecord
validates :name, :description, :price, presence: true
end
