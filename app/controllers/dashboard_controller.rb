class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :load_data, only: [:index, :show]

  def index
    # index view will automatically have access to @staffs, @memos, etc.
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def show
    case params[:section]
    when "memo"
      redirect_to memos_path # Redirect to MemoController's index action
    when "overview"
      render partial: "dashboard/overview"
    when "staff"
      redirect_to staff_index_path
    when "stock"
      redirect_to stock_index_path
    when "procurement"
      redirect_to procurement_index_path
    else
      render plain: "No content available", status: :not_found
    end
  end

  private

  def load_data
    @staffs = Staff.all
    @memos = Memo.all
    @stock_items = StockItem.order(quantity: :desc)
    @procurement_items = ProcurementItem.order(:date)
  end
end
