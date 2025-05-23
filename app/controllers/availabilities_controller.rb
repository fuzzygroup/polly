class AvailabilitiesController < ApplicationController
  before_action :set_availability, only: %i[ show edit update destroy ]

  # GET /availabilities or /availabilities.json
  def index
    @organization = Organization.indiana50501
    @organization = current_user.organization if current_user
    @availabilities = Availability.where(organization_id: @organization.id).active.order("date_start DESC")
  end

  # GET /availabilities/1 or /availabilities/1.json
  def show
  end

  # GET /availabilities/new
  def new
    @availability = Availability.new
    @users = User.all.order("last_name DESC")
  end

  # GET /availabilities/1/edit
  def edit
  end

  # POST /availabilities or /availabilities.json
  def create
    @availability = Availability.new(availability_params.merge(organization_id: current_user.organization_id))

    respond_to do |format|
      if @availability.save
        format.html { redirect_to @availability, notice: "Availability was successfully created." }
        format.json { render :show, status: :created, location: @availability }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /availabilities/1 or /availabilities/1.json
  def update
    respond_to do |format|
      if @availability.update(availability_params)
        format.html { redirect_to @availability, notice: "Availability was successfully updated." }
        format.json { render :show, status: :ok, location: @availability }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /availabilities/1 or /availabilities/1.json
  def destroy
    @availability.destroy!

    respond_to do |format|
      format.html { redirect_to availabilities_path, status: :see_other, notice: "Availability was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_availability
      @availability = Availability.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def availability_params
      params.expect(availability: [ :user_id, :date_start, :date_end, :availability ])
    end
end
