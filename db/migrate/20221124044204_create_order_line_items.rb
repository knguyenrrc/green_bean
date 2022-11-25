class CreateOrderLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_line_items do |t|
      t.float :price
      t.integer :quantity
      t.float :total_tax_rate
      t.references :Order, null: false, foreign_key: true
      t.references :Product, null: false, foreign_key: true
      t.references :Tax, null: false, foreign_key: true

      t.timestamps
    end
  end
end
