class SpeechesController < ApplicationController
  before_action :set_speech, only: %i[ show edit update destroy  upvote downvote]
  
  def upvote
    #raise "foo"
    if current_user.voted_up_on?(@speech)
      @speech.unvote_by current_user
    else
      @speech.upvote_by current_user
    end
    #redirect_to @project
    redirect_to '/speeches'
  end

  def downvote
    if current_user.voted_down_on?(@speech)
      @speech.unvote_by current_user
    else
      @speech.downvote_by current_user
    end
    #redirect_to @project
    redirect_to '/speeches'
  end

  # GET /speeches or /speeches.json
  def index
    @speeches = Speech.all
  end

  # GET /speeches/1 or /speeches/1.json
  def show
    #require 'redcarpet'
    #markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new)
    #@speech_body = markdown.render(@speech.body)
    # markdown_text = @speech.body
    #
    # renderer = Redcarpet::Render::HTML.new(
    #       filter_html: true,
    #       hard_wrap: true
    #     )
    #
    #     markdown = Redcarpet::Markdown.new(renderer, {
    #       autolink: true,
    #       tables: true,
    #       fenced_code_blocks: true
    #     })
    #
    #     @speech_body = markdown.render(markdown_text).html_safe
    
    #require 'cmark-gfm'

    markdown_text = "# Hello World\n\nThis is *GitHub* **Markdown**."
    #html_output = CMarkGFM.render_html(markdown_text, :DEFAULT)
  end

  # GET /speeches/new
  def new
    @speech = Speech.new
  end

  # GET /speeches/1/edit
  def edit
  end

  # POST /speeches or /speeches.json
  def create
    @speech = Speech.new(speech_params)

    respond_to do |format|
      if @speech.save
        format.html { redirect_to @speech, notice: "Speech was successfully created." }
        format.json { render :show, status: :created, location: @speech }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @speech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /speeches/1 or /speeches/1.json
  def update
    respond_to do |format|
      if @speech.update(speech_params)
        format.html { redirect_to @speech, notice: "Speech was successfully updated." }
        format.json { render :show, status: :ok, location: @speech }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @speech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /speeches/1 or /speeches/1.json
  def destroy
    @speech.destroy!

    respond_to do |format|
      format.html { redirect_to speeches_path, status: :see_other, notice: "Speech was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speech
      @speech = Speech.find_by_slug(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def speech_params
      params.expect(speech: [ :name, :tags, :speaker_id, :user_id, :event_id, :body ])
    end
end
