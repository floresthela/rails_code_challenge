class ProductSubCategory < ApplicationRecord
  belongs_to :product_category, foreign_key: :product_category_id
end
