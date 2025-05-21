class EventsController < ApplicationController
  #before_action :set_organization
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    if current_user.nil?
      @events = Event.active.where(organization: Organization.indiana50501, visibility: "all").order("date_start DESC")
    elsif current_user
      @events = Event.active.where(organization: current_user.organization).order("date_start DESC")
    end
      
      
    # if current_user && current_user.is_admin?
    #   @events = Event.active.where(organization: current_user.organization, visibility: "all", visibility: "").order("date_start DESC")
    # elsif current_user
    #
    # else
    #
    # end
    #.where(["date_start >= ?", Date.today])
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to events_path, status: :see_other, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find_by_slug(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.expect(event: [ :name, :event_type_id, :date_start, :date_end, :time_start, :time_end, :location, :share_code_id, :organization_id, :user_id, :has_speakers, :has_musicians, :has_props, :has_partners, :body ])
    end
end
