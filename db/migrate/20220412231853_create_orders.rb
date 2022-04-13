class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.integer :source_order_id
      t.date :date
      t.integer :priority
      t.references :customer, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
