class Product < ApplicationRecord
  has_many :line_items # has many reation wit line items
  before_destroy :ensure_not_referenced_by_any_line_item
  has_many :orders, through: :line_items # has assoication to orders via line items
  validates :title, :supply, :description, :image_url, :price, presence: true # presence check for the listed feilds
  validates :price, numericality: {greater_than_or_equal_to: 0.0, less_than_or_equal_to:1000.00} #validates numericality via cahecking for value constrains such as has to be grater than eqaul to 0 and less than eqaul to 1000
  validates :supply, numericality: {greater_than_or_equal_to: 0} # validates supply not to be less than 0
  validates :title, uniqueness: true # title or name of prodct should be unique
  validates :image_url, allow_blank: true, format: { # invokes a forat for all urls anything esle will not be accepted 
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
