class EventTasksController < ApplicationController
  before_action :set_event_task, only: %i[ show edit update destroy ]
  before_action :set_event,only: %i[ show edit update destroy ]

  # GET /event_tasks or /event_tasks.json
  def index
    @event_tasks = EventTask.all
  end

  # GET /event_tasks/1 or /event_tasks/1.json
  def show
  end

  # GET /event_tasks/new
  def new
    @event_task = EventTask.new
    #raise @event.inspect
  end

  # GET /event_tasks/1/edit
  def edit
  end

  # POST /event_tasks or /event_tasks.json
  def create
    @event_task = EventTask.new(event_task_params)

    respond_to do |format|
      if @event_task.save
        format.html { redirect_to @event_task, notice: "Event task was successfully created." }
        format.json { render :show, status: :created, location: @event_task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_tasks/1 or /event_tasks/1.json
  def update
    respond_to do |format|
      if @event_task.update(event_task_params)
        format.html { redirect_to @event_task, notice: "Event task was successfully updated." }
        format.json { render :show, status: :ok, location: @event_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_tasks/1 or /event_tasks/1.json
  def destroy
    @event_task.destroy!

    respond_to do |format|
      format.html { redirect_to event_tasks_path, status: :see_other, notice: "Event task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_task
      @event_task = EventTask.find(params.expect(:id))
    end
    
    def set_event
      @event = Event.find_by_slug(params.expect(:slug))
    end

    # Only allow a list of trusted parameters through.
    def event_task_params
      params.expect(event_task: [ :name, :event_id, :user_id, :team_id, :done, :body, :notes ])
    end
end
