require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many(:order_products) }
  it { should belong_to(:product_category) }
end
