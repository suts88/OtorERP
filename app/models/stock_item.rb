class StockItem < ApplicationRecord
  enum status: { in_stock: 0, out_of_stock: 1, low_in_stock: 2 }

  # Callback to calculate total_amount before saving
  before_save :calculate_total_amount

  private

  def calculate_total_amount
    self.total_amount = price * quantity
  end
end
