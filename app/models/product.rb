class Product < ApplicationRecord
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :supply, :description, :image_url, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.0, less_than_or_equal_to:1000.00}
  validates :supply, numericality: {greater_than_or_equal_to: 0}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png|jpeg)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
}
  private
# ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end
end
