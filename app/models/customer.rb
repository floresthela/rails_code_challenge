class Customer < ApplicationRecord
  has_many :orders
  belongs_to :region, foreign_key: :region_id

  enum segment: {
    consumer: 0,
    corporate: 1,
    home_office: 2,
    small_business: 3
  }
end
