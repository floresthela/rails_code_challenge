class OrderProduct < ApplicationRecord
  belongs_to :order, foreign_key: :order_id
  belongs_to :product, foreign_key: :product_id

  enum shipping_mode: {
    delivery_truck: 0,
    regular_air: 1,
    express_air: 2
  }
end
