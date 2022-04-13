require "rails_helper"

RSpec.describe(ProductCreator) do
  describe ".call" do
    let(:region){ create(:region) }
    let(:province){ create(:province, region: region) }
    let(:customer){ create(:customer, region: region) }
    let(:product_category){ create(:product_category) }

    context "service creates new Product" do
      let(:params) do {
        name: Faker::Games::Minecraft.block,
        container: "jumbo_box",
        base_margin: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        unit_price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        shipping_cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        product_category_id: product_category.id
      }
      end

      it "creates product with params sent" do
        new_product = ProductCreator.call(params)
        
        expect(new_product.name).to eql(params[:name])
        expect(new_product.container).to eql(params[:container])
        expect(new_product.base_margin).to eql(params[:base_margin])
        expect(new_product.unit_price).to eql(params[:unit_price])
        expect(new_product.shipping_cost).to eql(params[:shipping_cost])
        expect(new_product.product_category_id).to eql(product_category.id)
      end
    end

    context "service doesn't create existing Product" do
      let(:product){ create(:product, product_category: product_category)}

      let(:params) do {
        name: product.name,
        container: "jumbo_box",
        base_margin: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        unit_price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        shipping_cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        product_category_id: product_category.id
      }
      end

      it "does not create new Product" do
        ProductCreator.call(params)
        expect(Product.all.count).to eql(1)
      end
    end
  end
end
