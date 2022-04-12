class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products, id: :uuid do |t|
      t.decimal :profit, scale: 4, precision: 10
      t.integer :order_quantity
      t.integer :shipping_mode
      t.date :shipping_date
      t.decimal :sales, scale: 8, precision: 16
      t.decimal :discount, scale: 2, precision: 4
      t.references :order, null: false, foreign_key: true, type: :uuid
      t.references :product, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
