class CreateStaffs < ActiveRecord::Migration[7.2]
  def change
    create_table :staffs do |t|
      t.integer :sn
      t.string :staff_id
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :email
      t.string :phone_no
      t.string :role
      t.float :salary

      t.timestamps
    end
  end
end
