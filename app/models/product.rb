class Product < ActiveRecord::Base
  validates :product_id, presence: true
  validates :product_name, length: { in: 2..6 }
  validates :discontinued, presence: true
  validates_with CategoryValidator
end
