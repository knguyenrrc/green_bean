class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.text :contact_detail

      t.timestamps
    end
  end
end
