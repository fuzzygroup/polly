class VettingTranscriptsController < ApplicationController
  before_action :set_vetting_transcript, only: %i[ show edit update destroy ]

  # GET /vetting_transcripts or /vetting_transcripts.json
  def index
    @vetting_transcripts = VettingTranscript.all
  end

  # GET /vetting_transcripts/1 or /vetting_transcripts/1.json
  def show
  end

  # GET /vetting_transcripts/new
  def new
    @vetting_transcript = VettingTranscript.new
  end

  # GET /vetting_transcripts/1/edit
  def edit
  end

  # POST /vetting_transcripts or /vetting_transcripts.json
  def create
    @vetting_transcript = VettingTranscript.new(vetting_transcript_params)

    respond_to do |format|
      if @vetting_transcript.save
        format.html { redirect_to @vetting_transcript, notice: "Vetting transcript was successfully created." }
        format.json { render :show, status: :created, location: @vetting_transcript }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vetting_transcript.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vetting_transcripts/1 or /vetting_transcripts/1.json
  def update
    respond_to do |format|
      if @vetting_transcript.update(vetting_transcript_params)
        format.html { redirect_to @vetting_transcript, notice: "Vetting transcript was successfully updated." }
        format.json { render :show, status: :ok, location: @vetting_transcript }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vetting_transcript.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vetting_transcripts/1 or /vetting_transcripts/1.json
  def destroy
    @vetting_transcript.destroy!

    respond_to do |format|
      format.html { redirect_to vetting_transcripts_path, status: :see_other, notice: "Vetting transcript was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vetting_transcript
      @vetting_transcript = VettingTranscript.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def vetting_transcript_params
      params.expect(vetting_transcript: [ :name, :organization_id, :user_id, :group_id, :chat_type, :chat_user, :active, :body, :extracted_objects ])
    end
end
