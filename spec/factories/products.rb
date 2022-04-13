FactoryBot.define do
  factory :product do
    name { Faker::Types.rb_string }
    container { 0 }
    base_margin { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    unit_price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    shipping_cost { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    product_category { create(:product_category) }
  end
end
