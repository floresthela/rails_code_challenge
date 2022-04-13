require 'csv'

csv_uri = 'https://raw.githubusercontent.com/coba-ai/short_code_challenge/master/Superstore_sales.csv'
csv_text = URI.open(csv_uri).read.encode('UTF-8')

# Custom converter for columns
CSV::Converters[:custom] = lambda { |value, field_info|
  case field_info.header
  when "Customer Segment", "Product Container", "Ship Mode", "Order Priority"
    value.parameterize(separator: '_')
  when "Ship Date", "Order Date"
    Date.strptime(value, '%m/%d/%Y')
  when "Product Name"
    value.gsub('"', '')
  when "Customer Name", "Province", "Region", "Product Category", "Product Sub-Category"
    value.to_s
  when "Order Quantity", "Order ID"
    value.to_i
  when "Sales", "Profit", "Unit Price", "Shipping Cost", "Product Base Margin", "Discount"
    value.to_f
  end
}

csv = CSV.parse(csv_text, :headers => true, :converters => [:custom, :integer, :float])

csv.each do |row|
  # Create distinct regions by name
  region = Region.find_or_create_by(name: row["Region"]) do |r|
    r.name = row["Region"]
  end

  # Create distinct provinces by name
  province = Province.find_or_create_by(name: row["Province"]) do |p|
    p.name = row["Province"]
    p.region_id = region.id
  end

  # Create customers by name
  customer = Customer.find_or_create_by(name: row["Customer Name"]) do |c|
    c.name = row["Customer Name"]
    c.segment = row["Customer Segment"]
    c.region_id = region.id
  end

  # Create product categories by name
  product_category = ProductCategory.find_or_create_by(name: row["Product Category"]) do |pc|
    pc.name = row["Product Category"]
  end

  # Create product sub-categories by name
  product_subcategory = ProductSubCategory.find_or_create_by(name: row["Product Sub-Category"]) do |psc|
    psc.name = row["Product Sub-Category"]
    psc.product_category_id = product_category.id
  end

  pp row["Unit Price"]
  # Call service to create Product
  product = ProductCreator.call({
    name: row["Product Name"],
    container: row["Product Container"],
    base_margin: row["Product Base Margin"],
    unit_price: row["Unit Price"],
    shipping_cost: row["Shipping Cost"],
    product_category_id: product_category.id
  })
  
  pp product
  pp product.unit_price

  # Call service to create Order
  order = OrderCreator.call({
    source_order_id: row["Order ID"],
    date: row["Order Date"],
    customer_id: customer.id,
    product_id: product.id,
    profit: row["Profit"],
    quantity: row["Order Quantity"],
    shipping_mode: row["Ship Mode"],
    shipping_date: row["Ship Date"],
    sales: row["Sales"],
    discount: row["Discount"],
    priority: row["Order Priority"]
  })
end
