FactoryBot.define do
  factory :province do
    name { Faker::Nation.capital_city }
  end
end
