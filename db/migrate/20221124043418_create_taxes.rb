class CreateTaxes < ActiveRecord::Migration[7.0]
  def change
    create_table :taxes do |t|
      t.float :pst
      t.float :gst
      t.float :hst
      t.float :total_tax_rate
      t.references :Province, null: false, foreign_key: true

      t.timestamps
    end
  end
end
