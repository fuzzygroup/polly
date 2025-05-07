class VettingQuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vetting_question, only: %i[ show edit update destroy upvote downvote]

  # GET /vetting_questions or /vetting_questions.json
  def index
    @vetting_questions = VettingQuestion.all
  end

  # GET /vetting_questions/1 or /vetting_questions/1.json
  def show
  end

  # GET /vetting_questions/new
  def new
    @vetting_question = VettingQuestion.new
  end

  # GET /vetting_questions/1/edit
  def edit
  end
  
  def upvote
    #raise "foo"
    if current_user.voted_up_on?(@vetting_question)
      @vetting_question.unvote_by current_user
    else
      @vetting_question.upvote_by current_user
    end
    #redirect_to @project
    redirect_to '/vetting_questions'
  end

  def downvote
    if current_user.voted_down_on?(@vetting_question)
      @vetting_question.unvote_by current_user
    else
      @vetting_question.downvote_by current_user
    end
    #redirect_to @project
    redirect_to '/vetting_questions'
  end

  # POST /vetting_questions or /vetting_questions.json
  def create
    @vetting_question = VettingQuestion.new(vetting_question_params)

    respond_to do |format|
      if @vetting_question.save
        format.html { redirect_to @vetting_question, notice: "Vetting question was successfully created." }
        format.json { render :show, status: :created, location: @vetting_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vetting_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vetting_questions/1 or /vetting_questions/1.json
  def update
    respond_to do |format|
      if @vetting_question.update(vetting_question_params)
        format.html { redirect_to @vetting_question, notice: "Vetting question was successfully updated." }
        format.json { render :show, status: :ok, location: @vetting_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vetting_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vetting_questions/1 or /vetting_questions/1.json
  def destroy
    @vetting_question.destroy!

    respond_to do |format|
      format.html { redirect_to vetting_questions_path, status: :see_other, notice: "Vetting question was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def ask_questions
    #raise "Still being finished"
    selected_question_ids = params[:question_ids] || []
    @selected_questions = VettingQuestion.where(id: selected_question_ids)
    # respond_to do |format|
    #   format.html { redirect_to '/vetting_questions/show_selected_questions', notice: "Please follow the instructions belowddd." }
    #   #format.json { render :show, status: :ok, location: @contact_card }
    # end
    
    #redirect_to 'show_selected_questions' and return
    # Now you can do whatever you want with @selected_items
    # For example:
    #
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vetting_question
      @vetting_question = VettingQuestion.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def vetting_question_params
      params.expect(vetting_question: [ :body, :organization_id, :user_id, :group_id, :active, :question_ids])
    end
end
