class PollOptionsController < ApplicationController
  before_action :set_poll_option, only: %i[ show edit update destroy ]

  # GET /poll_options or /poll_options.json
  def index
    @poll_options = PollOption.all
  end

  # GET /poll_options/1 or /poll_options/1.json
  def show
  end

  # GET /poll_options/new
  def new
    @poll_option = PollOption.new
  end

  # GET /poll_options/1/edit
  def edit
  end

  # POST /poll_options or /poll_options.json
  def create
    @poll_option = PollOption.new(poll_option_params)

    respond_to do |format|
      if @poll_option.save
        format.html { redirect_to @poll_option, notice: "Poll option was successfully created." }
        format.json { render :show, status: :created, location: @poll_option }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poll_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poll_options/1 or /poll_options/1.json
  def update
    respond_to do |format|
      if @poll_option.update(poll_option_params)
        format.html { redirect_to @poll_option, notice: "Poll option was successfully updated." }
        format.json { render :show, status: :ok, location: @poll_option }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poll_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poll_options/1 or /poll_options/1.json
  def destroy
    @poll_option.destroy!

    respond_to do |format|
      format.html { redirect_to poll_options_path, status: :see_other, notice: "Poll option was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll_option
      @poll_option = PollOption.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def poll_option_params
      params.expect(poll_option: [ :name, :poll_id, :widget_type, :value, :body ])
    end
end
