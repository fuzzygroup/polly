class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  
  before_action :set_post, only: [:upvote, :downvote]
  
  def upvote
    if current_user.voted_up_on?(@project)
      @project.unvote_by current_user
    else
      @project.upvote_by current_user
    end
    redirect_to @project
  end

  def downvote
    if current_user.voted_down_on?(@project)
      @project.unvote_by current_user
    else
      @project.downvote_by current_user
    end
    redirect_to @project
  end



  # GET /projects or /projects.json
  def index
    @projects = Project.active
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy!

    respond_to do |format|
      format.html { redirect_to projects_path, status: :see_other, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params.expect(:id))
    end
    
    # Only allow a list of trusted parameters through.
    def project_params
      params.expect(project: [ :name, :organization_id, :user_id, :group_id, :project_type, :active, :body ])
    end
end
