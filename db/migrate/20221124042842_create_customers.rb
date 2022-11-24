class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :customer_name
      t.integer :phone
      t.string :email
      t.references :Address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
