# app/models/procurement_item.rb
class ProcurementItem < ApplicationRecord
  include StatusEnum

  belongs_to :requested_by, class_name: 'Staff', foreign_key: 'requested_by_id'
  belongs_to :sent_to, class_name: 'Staff', foreign_key: 'sent_to_id'

  before_save :calculate_total_amount

  private

  def calculate_total_amount
    self.total_amount = price * quantity
  end
end
