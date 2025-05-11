class EventPropsController < ApplicationController
  before_action :set_event_prop, only: %i[ show edit update destroy ]

  # GET /event_props or /event_props.json
  def index
    @event_props = EventProp.all
  end

  # GET /event_props/1 or /event_props/1.json
  def show
  end

  # GET /event_props/new
  def new
    @event_prop = EventProp.new
  end

  # GET /event_props/1/edit
  def edit
  end

  # POST /event_props or /event_props.json
  def create
    @event_prop = EventProp.new(event_prop_params)

    respond_to do |format|
      if @event_prop.save
        format.html { redirect_to @event_prop, notice: "Event prop was successfully created." }
        format.json { render :show, status: :created, location: @event_prop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_prop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_props/1 or /event_props/1.json
  def update
    respond_to do |format|
      if @event_prop.update(event_prop_params)
        format.html { redirect_to @event_prop, notice: "Event prop was successfully updated." }
        format.json { render :show, status: :ok, location: @event_prop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_prop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_props/1 or /event_props/1.json
  def destroy
    @event_prop.destroy!

    respond_to do |format|
      format.html { redirect_to event_props_path, status: :see_other, notice: "Event prop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_prop
      @event_prop = EventProp.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def event_prop_params
      params.expect(event_prop: [ :name, :organization_id, :user_id, :body ])
    end
end
