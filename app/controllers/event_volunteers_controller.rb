class EventVolunteersController < ApplicationController
  before_action :set_event_volunteer, only: %i[ show edit update destroy ]

  # GET /event_volunteers or /event_volunteers.json
  def index
    @event_volunteers = EventVolunteer.all
  end

  # GET /event_volunteers/1 or /event_volunteers/1.json
  def show
  end

  # GET /event_volunteers/new
  def new
    @event_volunteer = EventVolunteer.new
  end

  # GET /event_volunteers/1/edit
  def edit
  end

  # POST /event_volunteers or /event_volunteers.json
  def create
    @event_volunteer = EventVolunteer.new(event_volunteer_params)

    respond_to do |format|
      if @event_volunteer.save
        format.html { redirect_to @event_volunteer, notice: "Event volunteer was successfully created." }
        format.json { render :show, status: :created, location: @event_volunteer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_volunteers/1 or /event_volunteers/1.json
  def update
    respond_to do |format|
      if @event_volunteer.update(event_volunteer_params)
        format.html { redirect_to @event_volunteer, notice: "Event volunteer was successfully updated." }
        format.json { render :show, status: :ok, location: @event_volunteer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_volunteers/1 or /event_volunteers/1.json
  def destroy
    @event_volunteer.destroy!

    respond_to do |format|
      format.html { redirect_to event_volunteers_path, status: :see_other, notice: "Event volunteer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_volunteer
      @event_volunteer = EventVolunteer.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def event_volunteer_params
      params.expect(event_volunteer: [ :first_name, :last_name, :pronouns, :phone_number, :email, :event_id, :user_id, :how_do_you_want_to_help ])
    end
end
