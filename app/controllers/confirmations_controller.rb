class ConfirmationsController < ApplicationController
  before_action :set_confirmation, only: %i[ show edit update destroy ]

  # GET /confirmations or /confirmations.json
  def index
    @confirmations = Confirmation.all
  end

  # GET /confirmations/1 or /confirmations/1.json
  def show
  end

  # GET /confirmations/new
  def new
    new_params = {
      event_slot_id: params[:event_slot_id]
    }
    raise new_params.inspect 
    @confirmation = Confirmation.new(new_params)
  end

  # GET /confirmations/1/edit
  def edit
  end

  # POST /confirmations or /confirmations.json
  def create
    @confirmation = Confirmation.new(confirmation_params)

    respond_to do |format|
      if @confirmation.save
        format.html { redirect_to @confirmation, notice: "Confirmation was successfully created." }
        format.json { render :show, status: :created, location: @confirmation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @confirmation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /confirmations/1 or /confirmations/1.json
  def update
    respond_to do |format|
      if @confirmation.update(confirmation_params)
        format.html { redirect_to @confirmation, notice: "Confirmation was successfully updated." }
        format.json { render :show, status: :ok, location: @confirmation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @confirmation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confirmations/1 or /confirmations/1.json
  def destroy
    @confirmation.destroy!

    respond_to do |format|
      format.html { redirect_to confirmations_path, status: :see_other, notice: "Confirmation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_confirmation
      @confirmation = Confirmation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def confirmation_params
      params.expect(confirmation: [ :confirmable_id, :confirmable_type, :event_slot_id, :confirmed ])
    end
end
