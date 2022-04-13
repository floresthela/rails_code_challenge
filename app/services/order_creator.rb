class OrderCreator
  def self.call(params)

    # Create order
    @order = Order.find_or_create_by(source_order_id: params[:source_order_id]) do |o| 
      o.source_order_id = params[:source_order_id]
      o.date = params[:date]
      o.customer_id = params[:customer_id]
      o.priority = params[:priority]
    end

    # Create order product
    _order_product = OrderProduct.create!(order_product_params(params))
  end

  private
  def self.order_product_params(params)
    {
      profit: params[:profit],
      order_quantity: params[:quantity],
      shipping_mode: params[:shipping_mode],
      shipping_date: params[:shipping_date],
      sales: params[:sales],
      discount: params[:discount],
      product_id: params[:product_id],
      order_id: @order.id,
    }
  end
end
