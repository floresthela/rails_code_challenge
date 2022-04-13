class CreateProductSubCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :product_sub_categories, id: :uuid do |t|
      t.string :name
      t.references :product_category, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
