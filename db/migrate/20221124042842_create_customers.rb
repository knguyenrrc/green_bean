class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :customer_name
      t.integer :phone
      t.references :Address, null: true, foreign_key: true

      t.timestamps
    end
  end
end
