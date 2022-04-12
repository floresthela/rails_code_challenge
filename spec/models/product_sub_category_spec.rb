require 'rails_helper'

RSpec.describe ProductSubCategory, type: :model do
  it { should belong_to(:product_category) }
end
