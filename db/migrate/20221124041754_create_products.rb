class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.foat :price
      t.references :Category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
