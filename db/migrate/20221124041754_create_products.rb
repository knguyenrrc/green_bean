class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.float :price
      t.float :sale_price
      t.text :description
      t.references :Category, null: false, foreign_key: false

      t.timestamps
    end
  end
end
