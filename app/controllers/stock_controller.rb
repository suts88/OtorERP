class StockController < ApplicationController
  before_action :set_stock, only: %i[show edit update destroy]

  def index
    per_page = params[:per_page] || 5
    @stock = StockItem.all
    @total_stock= StockItem.count

    @stock  = @stock.page(params[:page]).per(per_page)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def set_stock
    @stock = StockItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def memo_params
    params.require(:staff).permit(:product_name, :product_id, :category, :price, :quantity, :total_amount, :supplier, :status)
  end
end
