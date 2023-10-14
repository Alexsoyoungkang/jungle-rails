class Product < ApplicationRecord
  monetize :price_cents, numericality: true # custom validation rules to ensure that the price_cents attribute is numeric
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true
end
