class AddFullNameAndDepartmentToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :full_name, :string
    add_column :users, :department, :integer
  end
end
