class AddStaffIdToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :staff_id, :integer
  end
end
