class MemosController < ApplicationController
  before_action :set_memo, only: %i[show edit update destroy]
  before_action :split_user_full_name, only: [:new, :edit, :update] # Falls nur in new benötigt

  # GET /memos or /memos.json
  def index
    per_page = params[:per_page] || 5
    @memos = Memo.all
    @total_memos = Memo.count

    # Filter by status if status param is present
    if params[:status].present?
      @memos = @memos.where(status: Memo.statuses[params[:status]])
    end

    # Füge eine Suchbedingung hinzu
    if params[:query].present?
      query = "%#{params[:query]}%"
      @memos = @memos.joins(:rich_text_message)
                     .where("memos.title ILIKE ? OR action_text_rich_texts.body ILIKE ?", query, query)
    end

    @memos = @memos.page(params[:page]).per(per_page)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  # GET /memos/1 or /memos/1.json
  def show
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  # GET /memos/new
  def new
    @staff = Staff.all
    @memo = Memo.new
    @user = current_user
  end

  # GET /memos/1/edit
  def edit
    @memo = Memo.find(params[:id])
    @staff = Staff.all
    @user = current_user
  end

  # POST /memos or /memos.json
  def create
    @memo = Memo.new(memo_params)
    @staff = Staff.all
    @user = current_user

    if @user.present?
      @memo.sent_from_id = @user.staff_id
    else
      Rails.logger.debug "Kein Staff-Eintrag für den aktuellen Benutzer gefunden."
      redirect_to new_memo_path, alert: "Sie haben keinen zugeordneten Staff-Eintrag." and return
    end

    respond_to do |format|
      if @memo.save
        format.html { redirect_to user_root_path, notice: "Memo wurde erfolgreich erstellt." }
        format.json { render :show, status: :created, location: @memo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /memos/1 or /memos/1.json
  def update
    @staff = Staff.all
    @user = current_user

    if @user.present? && @user.staff_id.present?
      params[:memo][:sent_from_id] = @user.staff_id
    else
      Rails.logger.debug "Kein Staff-Eintrag für den aktuellen Benutzer gefunden."
      redirect_to edit_memo_path(@memo), alert: "Sie haben keinen zugeordneten Staff-Eintrag." and return
    end

    respond_to do |format|
      if @memo.update(memo_params)
        format.html { render :show ,notice: "Memo wurde erfolgreich aktualisiert." }
        format.json { render :show, status: :ok, location: @memo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memos/1 or /memos/1.json
  def destroy
    @memo.destroy!

    respond_to do |format|
      format.html { redirect_to user_root_path, status: :see_other, notice: "Memo wurde erfolgreich gelöscht." }
      format.json { head :no_content }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@memo) }
    end
  end


  private

  def split_user_full_name
    if current_user.full_name.present?
      name_parts = current_user.full_name.split(" ", 2) # Split the name into two parts
      @current_user_firstname = name_parts[0]
      @current_user_lastname = name_parts[1] || "" # If there's no last name, use an empty string
    else
      @current_user_firstname = ""
      @current_user_lastname = ""
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_memo
    @memo = Memo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def memo_params
    params.require(:memo).permit(:title, :sent_from_id, :sent_to_id, :date, :message, :status)
  end

end
