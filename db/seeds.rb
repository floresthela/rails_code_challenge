require 'csv'

csv_uri = 'https://raw.githubusercontent.com/coba-ai/short_code_challenge/master/Superstore_sales.csv'

# Use url to raw csv
csv_text = URI.open(csv_uri).read.encode('UTF-8')

# Use file stored on project
# csv_text = File.read("#{Rails.root}/db/data_seed/Superstore_sales.csv", encoding: "Windows-1252").encode('UTF-8')

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
  pp row
end

pp "All orders were created..."
