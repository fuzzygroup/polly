class EventSlotTypesController < ApplicationController
  before_action :set_event_slot_type, only: %i[ show edit update destroy ]

  # GET /event_slot_types or /event_slot_types.json
  def index
    @event_slot_types = EventSlotType.all
  end

  # GET /event_slot_types/1 or /event_slot_types/1.json
  def show
  end

  # GET /event_slot_types/new
  def new
    @event_slot_type = EventSlotType.new
  end

  # GET /event_slot_types/1/edit
  def edit
  end

  # POST /event_slot_types or /event_slot_types.json
  def create
    @event_slot_type = EventSlotType.new(event_slot_type_params)

    respond_to do |format|
      if @event_slot_type.save
        format.html { redirect_to @event_slot_type, notice: "Event slot type was successfully created." }
        format.json { render :show, status: :created, location: @event_slot_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_slot_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_slot_types/1 or /event_slot_types/1.json
  def update
    respond_to do |format|
      if @event_slot_type.update(event_slot_type_params)
        format.html { redirect_to @event_slot_type, notice: "Event slot type was successfully updated." }
        format.json { render :show, status: :ok, location: @event_slot_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_slot_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_slot_types/1 or /event_slot_types/1.json
  def destroy
    @event_slot_type.destroy!

    respond_to do |format|
      format.html { redirect_to event_slot_types_path, status: :see_other, notice: "Event slot type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_slot_type
      @event_slot_type = EventSlotType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def event_slot_type_params
      params.expect(event_slot_type: [ :name, :default_duration, :default_duration_units ])
    end
end
