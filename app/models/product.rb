class Product < ApplicationRecord
  validates :name, :description, :price, presence: true
  attr_accessor :images
  has_many_attached :pictures
end
