class OfflinePromotionLocationsController < ApplicationController
  before_action :set_offline_promotion_location, only: %i[ show edit update destroy ]

  # GET /offline_promotion_locations or /offline_promotion_locations.json
  def index
    @offline_promotion_locations = OfflinePromotionLocation.all
  end

  # GET /offline_promotion_locations/1 or /offline_promotion_locations/1.json
  def show
  end

  # GET /offline_promotion_locations/new
  def new
    @offline_promotion_location = OfflinePromotionLocation.new
  end

  # GET /offline_promotion_locations/1/edit
  def edit
  end

  # POST /offline_promotion_locations or /offline_promotion_locations.json
  def create
    @offline_promotion_location = OfflinePromotionLocation.new(offline_promotion_location_params)

    respond_to do |format|
      if @offline_promotion_location.save
        format.html { redirect_to @offline_promotion_location, notice: "Offline promotion location was successfully created." }
        format.json { render :show, status: :created, location: @offline_promotion_location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @offline_promotion_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offline_promotion_locations/1 or /offline_promotion_locations/1.json
  def update
    respond_to do |format|
      if @offline_promotion_location.update(offline_promotion_location_params)
        format.html { redirect_to @offline_promotion_location, notice: "Offline promotion location was successfully updated." }
        format.json { render :show, status: :ok, location: @offline_promotion_location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offline_promotion_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offline_promotion_locations/1 or /offline_promotion_locations/1.json
  def destroy
    @offline_promotion_location.destroy!

    respond_to do |format|
      format.html { redirect_to offline_promotion_locations_path, status: :see_other, notice: "Offline promotion location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offline_promotion_location
      @offline_promotion_location = OfflinePromotionLocation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def offline_promotion_location_params
      params.expect(offline_promotion_location: [ :name, :contact_card_id ])
    end
end
