require "rails_helper"

RSpec.describe(OrderCreator) do
  describe ".call" do
    let(:region){ create(:region) }
    let(:customer){ create(:customer, region: region) }
    let(:product){ create(:product)}

    context "service creates new Order and OrderProduct" do
      let(:params) do {
        source_order_id: Faker::Number.number(digits: 3),
        date: Date.today - 4.days,
        customer_id: customer.id,
        product_id: product.id,
        profit: Faker::Number.decimal(l_digits: 5, r_digits: 2),
        quantity: Faker::Number.number(digits: 2),
        shipping_mode: "regular_air",
        shipping_date: Date.today,
        sales: Faker::Number.decimal(l_digits: 4, r_digits: 2),
        discount: Faker::Number.decimal(l_digits: 1, r_digits: 2),
        priority: "low"
      }
      end

      it "creates OrderProduct" do
        OrderCreator.call(params)
        order = Order.first

        expect(order.source_order_id).to eql(params[:source_order_id])
        expect(order.date).to eql(params[:date])
        expect(order.customer.id).to eql(params[:customer_id])
        expect(order.priority).to eql(params[:priority])
      end
      
      it "creates OrderProduct" do
        OrderCreator.call(params)
        order = Order.first
        order_product = OrderProduct.first

        expect(order_product.profit.to_f).to eql(params[:profit])
        expect(order_product.order_quantity).to eql(params[:quantity])
        expect(order_product.shipping_mode).to eql(params[:shipping_mode])
        expect(order_product.shipping_date).to eql(params[:shipping_date])
        expect(order_product.sales.to_f).to eql(params[:sales])
        expect(order_product.order_id).to eql(order.id)
        expect(order_product.discount.to_f).to eql(params[:discount])
        expect(order_product.product_id).to eql(params[:product_id])
      end
    end
  end
end
