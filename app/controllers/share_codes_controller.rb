class ShareCodesController < ApplicationController
  before_action :set_share_code, only: %i[ show edit update destroy ]

  # GET /share_codes or /share_codes.json
  def index
    @share_codes = ShareCode.all
  end

  # GET /share_codes/1 or /share_codes/1.json
  def show
  end

  # GET /share_codes/new
  def new
    @share_code = ShareCode.new
  end

  # GET /share_codes/1/edit
  def edit
  end

  # POST /share_codes or /share_codes.json
  def create
    @share_code = ShareCode.new(share_code_params)

    respond_to do |format|
      if @share_code.save
        format.html { redirect_to @share_code, notice: "Share code was successfully created." }
        format.json { render :show, status: :created, location: @share_code }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @share_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /share_codes/1 or /share_codes/1.json
  def update
    respond_to do |format|
      if @share_code.update(share_code_params)
        format.html { redirect_to @share_code, notice: "Share code was successfully updated." }
        format.json { render :show, status: :ok, location: @share_code }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @share_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /share_codes/1 or /share_codes/1.json
  def destroy
    @share_code.destroy!

    respond_to do |format|
      format.html { redirect_to share_codes_path, status: :see_other, notice: "Share code was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share_code
      @share_code = ShareCode.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def share_code_params
      params.expect(share_code: [ :share_code, :user_id, :organization_id, :event_id ])
    end
end
