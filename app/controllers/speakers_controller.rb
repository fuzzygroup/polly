class SpeakersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_speaker, only: %i[ show edit update destroy ]

  # GET /speakers or /speakers.json
  def index
    @speakers = Speaker.all.order("name ASC")
  end

  # GET /speakers/1 or /speakers/1.json
  def show
  end

  # GET /speakers/new
  def new
    @speaker = Speaker.new
  end

  # GET /speakers/1/edit
  def edit
  end

  # POST /speakers or /speakers.json
  def create
    @speaker = Speaker.new(speaker_params)

    respond_to do |format|
      if @speaker.save
        format.html { redirect_to @speaker, notice: "Speaker was successfully created." }
        format.json { render :show, status: :created, location: @speaker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /speakers/1 or /speakers/1.json
  def update
    respond_to do |format|
      if @speaker.update(speaker_params)
        format.html { redirect_to @speaker, notice: "Speaker was successfully updated." }
        format.json { render :show, status: :ok, location: @speaker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /speakers/1 or /speakers/1.json
  def destroy
    @speaker.destroy!

    respond_to do |format|
      format.html { redirect_to speakers_path, status: :see_other, notice: "Speaker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speaker
      @speaker = Speaker.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def speaker_params
      params.expect(speaker: [ :name, :bio, :url, :pronouns, :speaking_count, :notes, :organization_id, :user_id ])
    end
end
