class UpdateProductShippingCostAndBaseMargin < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :base_margin, :decimal, precision: 10, scale: 4
    change_column :products, :shipping_cost, :decimal, precision: 10, scale: 4
  end
end
