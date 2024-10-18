class AddTitleAndStatusToMemos < ActiveRecord::Migration[7.2]
  def change
    add_column :memos, :title, :string
    add_column :memos, :status, :integer
  end
end
