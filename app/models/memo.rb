class Memo < ApplicationRecord
  include StatusEnum
  belongs_to :sent_from, class_name: "Staff"
  belongs_to :sent_to, class_name: "Staff"

  has_rich_text :message
  validates :sent_from, presence: true
  validates :sent_to, presence: true

  before_create :set_sn

  private

  def set_sn
    self.sn = Memo.maximum(:sn).to_i + 1
  end
end
