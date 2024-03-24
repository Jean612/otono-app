class CreateProductCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :product_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
