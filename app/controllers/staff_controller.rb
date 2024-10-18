class StaffController < ApplicationController
  before_action :set_staff, only: %i[show edit update destroy]

  def index
    per_page = params[:per_page] || 5
    @staff = Staff.all
    @total_staff = Staff.count

    @staff = @staff.page(params[:page]).per(per_page)

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

  def set_staff
    @staff = Staff.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def memo_params
    params.require(:staff).permit(:staff_id, :firstname, :lastname, :email, :phone_no, :address, :role, :salary)
  end
end
