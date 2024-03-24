class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :stock, default: 0
      t.string :image_path, null: false
      t.text :description, null: false

      t.timestamps
    end

    add_index :products, :name
    add_index :products, :description
  end
end
