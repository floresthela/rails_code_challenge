class CreateProvinces < ActiveRecord::Migration[6.1]
  def change
    create_table :provinces, id: :uuid do |t|
      t.string :name
      t.references :region, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
