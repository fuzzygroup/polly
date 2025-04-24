class FliersController < ApplicationController
  before_action :set_flier, only: %i[ show edit update destroy ]
  
  before_action :set_flier_types, only: %i[new edit]
  
  before_action :set_projects, only: %i[new edit]

  # GET /fliers or /fliers.json
  def index
    @fliers = Flier.all
  end

  # GET /fliers/1 or /fliers/1.json
  def show
  end

  # GET /fliers/new
  def new
    # nickjj
    @flier = Flier.new()
  end

  # GET /fliers/1/edit
  def edit
  end

  # POST /fliers or /fliers.json
  def create
    @flier = Flier.new(flier_params)
    @flier.user = current_user
    @flier.organization = current_user.organization

    respond_to do |format|
      if @flier.save
        format.html { redirect_to @flier, notice: "Flier was successfully created." }
        format.json { render :show, status: :created, location: @flier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fliers/1 or /fliers/1.json
  def update
    respond_to do |format|
      if @flier.update(flier_params)
        format.html { redirect_to @flier, notice: "Flier was successfully updated." }
        format.json { render :show, status: :ok, location: @flier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fliers/1 or /fliers/1.json
  def destroy
    @flier.destroy!

    respond_to do |format|
      format.html { redirect_to fliers_path, status: :see_other, notice: "Flier was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flier
      @flier = Flier.find(params.expect(:id))
    end
    
    def set_flier_types
      @flier_types = ["event_flier", "billboard", "other", "software_illustration"].sort
    end

    def set_projects
      # nickjj
      @projects = Project.active.order("name ASC")
    end


    # Only allow a list of trusted parameters through.
    def flier_params
      #params.expect(flier: [ :title, :organization_id, :user_id, :group_id, :project_id, :image ])
      params.expect(flier: [ :title, :project_id, :image ])
    end
end
