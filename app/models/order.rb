class Order < ApplicationRecord
  has_many :order_products
  belongs_to :customer, foreign_key: :customer_id

  enum priority: {
    critical: 0,
    high: 1,
    low: 2,
    medium: 3,
    not_specified: 4
  }
end
