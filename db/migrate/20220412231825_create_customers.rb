class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers, id: :uuid do |t|
      t.string :name
      t.integer :segment
      t.references :region, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
