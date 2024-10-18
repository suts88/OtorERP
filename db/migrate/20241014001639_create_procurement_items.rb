class CreateProcurementItems < ActiveRecord::Migration[7.2]
  def change
    create_table :procurement_items do |t|
      t.integer :sn
      t.string :itemname
      t.float :price
      t.integer :quantity
      t.float :total_amount
      t.references :requested_by, foreign_key: { to_table: :staffs }  # Fix: Verweis auf staff
      t.references :sent_to, foreign_key: { to_table: :staffs }        # Fix: Verweis auf staff
      t.date :date
      t.integer :status

      t.timestamps
    end
  end
end
