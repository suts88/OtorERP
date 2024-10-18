class CreateStockItems < ActiveRecord::Migration[7.2]
  def change
    create_table :stock_items do |t|
      t.integer :sn
      t.string :product_name
      t.string :product_id
      t.string :category
      t.float :price
      t.integer :quantity
      t.float :total_amount
      t.string :supplier
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
