class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name
      t.integer :container
      t.decimal :base_margin, scale: 4, precision: 6
      t.decimal :unit_price, scale: 4, precision: 10
      t.decimal :shipping_cost, scale: 4, precision: 6
      t.references :product_category, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
