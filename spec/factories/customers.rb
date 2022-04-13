FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    segment { 0 }
    region { create(:region) }
  end
end
