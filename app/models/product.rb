class Product < ApplicationRecord
  validates :title, :supply, :description, :image_url, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.0, less_than_or_equal_to:1000.00}
  validates :supply, numericality: {greater_than_or_equal_to: 1}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png|jpeg)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
}
end
