# frozen_string_literal: true

module StatusEnum
  extend ActiveSupport::Concern

  included do
    enum status: { Pending: 0, Approved: 1, Rejected: 2 }
  end
end