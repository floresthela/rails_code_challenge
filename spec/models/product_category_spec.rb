require 'rails_helper'

RSpec.describe ProductCategory, type: :model do
  it { should have_many(:products) }
  it { should have_many(:product_sub_categories) }
end
