FactoryBot.define do
  factory :product_sub_category do
    name { Faker::Types.rb_string }
    product_category { create(:product_category) }
  end
end
