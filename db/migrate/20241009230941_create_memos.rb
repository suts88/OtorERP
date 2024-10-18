class CreateMemos < ActiveRecord::Migration[7.2]
  def change
    create_table :memos do |t|
      t.integer :sn
      t.references :sent_from, foreign_key: { to_table: :staffs }, null: false
      t.references :sent_to, foreign_key: { to_table: :staffs }, null: false
      t.date :date
      t.timestamps
    end
  end
end
