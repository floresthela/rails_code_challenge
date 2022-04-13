class ProductCreator
  def self.call(params)
    pp params[:unit_price]

    # Create or find Product by name
    my_product = Product.find_or_create_by(name: params[:name]) do |p|
      p.name = params[:name]
      p.container = params[:container]
      p.base_margin = params[:base_margin]
      p.unit_price = params[:unit_price],
      p.shipping_cost = params[:shipping_cost],
      p.product_category_id = params[:product_category_id]
    end
  end
end
