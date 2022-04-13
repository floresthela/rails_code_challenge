class Product < ApplicationRecord
  has_many :order_products
  belongs_to :product_category, foreign_key: :product_category_id

  enum container: {
    jumbo_box: 0,
    jumbo_drum: 1,
    large_box: 2,
    small_box: 3,
    medium_box: 4,
    small_pack: 5,
    wrap_bag: 6
  }
end
