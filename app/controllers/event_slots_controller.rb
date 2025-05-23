class EventSlotsController < ApplicationController
  before_action :set_event_slot, only: %i[ show edit update destroy ]

  # GET /event_slots or /event_slots.json
  def index
    @event_slots = EventSlot.all
  end

  # GET /event_slots/1 or /event_slots/1.json
  def show
  end

  # GET /event_slots/new
  def new
    @event_slot = EventSlot.new
  end

  # GET /event_slots/1/edit
  def edit
    @speeches = Speech.all
  end

  # POST /event_slots or /event_slots.json
  def create
    @event_slot = EventSlot.new(event_slot_params)

    respond_to do |format|
      if @event_slot.save
        format.html { redirect_to @event_slot, notice: "Event slot was successfully created." }
        format.json { render :show, status: :created, location: @event_slot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_slots/1 or /event_slots/1.json
  def update
    respond_to do |format|
      if @event_slot.update(event_slot_params)
        format.html { redirect_to @event_slot, notice: "Event slot was successfully updated." }
        format.json { render :show, status: :ok, location: @event_slot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_slots/1 or /event_slots/1.json
  def destroy
    @event_slot.destroy!

    respond_to do |format|
      format.html { redirect_to event_slots_path, status: :see_other, notice: "Event slot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_slot
      @event_slot = EventSlot.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def event_slot_params
      params.expect(event_slot: [ :name, :event_id, :event_slot_type_id, :speaker_id, :duration, :computed_start_at, :body, :speech_id])
    end
end
