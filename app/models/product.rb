class Product < ApplicationRecord
  acts_as_paranoid
  validates :name, :description, :price, presence: true
  attr_accessor :images
  has_many :feedbacks, dependent: :destroy
  has_many_attached :pictures
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :cart_items, dependent: :destroy
end
