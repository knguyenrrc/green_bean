class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.float :sub_amount
      t.float :total_tax_rate
      t.float :total_amount
      t.date :date_created
      t.references :Customer, null: false, foreign_key: true
      t.references :Tax, null: false, foreign_key: true

      t.timestamps
    end
  end
end
