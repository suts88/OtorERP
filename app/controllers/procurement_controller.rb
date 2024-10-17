class ProcurementController < ApplicationController
  before_action :set_proc, only: %i[show edit update destroy]

  def index
    per_page = params[:per_page] || 5
    @proc= ProcurementItem.all
    @total_proc= ProcurementItem.count

    @proc = @proc.page(params[:page]).per(per_page)

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

  def set_proc
    @proc = ProcurementItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def memo_params
    params.require(:staff).permit(:itemname, :price, :quantity, :total_amount, :requested_by_id, :sent_to_id, :date, :status)
  end
end
