class OrganizationRolesController < ApplicationController
  before_action :set_organization_role, only: %i[ show edit update destroy ]

  # GET /organization_roles or /organization_roles.json
  def index
    @organization_roles = OrganizationRole.all
  end

  # GET /organization_roles/1 or /organization_roles/1.json
  def show
  end

  # GET /organization_roles/new
  def new
    @organization_role = OrganizationRole.new
  end

  # GET /organization_roles/1/edit
  def edit
  end

  # POST /organization_roles or /organization_roles.json
  def create
    @organization_role = OrganizationRole.new(organization_role_params)

    respond_to do |format|
      if @organization_role.save
        format.html { redirect_to @organization_role, notice: "Organization role was successfully created." }
        format.json { render :show, status: :created, location: @organization_role }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization_roles/1 or /organization_roles/1.json
  def update
    respond_to do |format|
      if @organization_role.update(organization_role_params)
        format.html { redirect_to @organization_role, notice: "Organization role was successfully updated." }
        format.json { render :show, status: :ok, location: @organization_role }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_roles/1 or /organization_roles/1.json
  def destroy
    @organization_role.destroy!

    respond_to do |format|
      format.html { redirect_to organization_roles_path, status: :see_other, notice: "Organization role was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_role
      @organization_role = OrganizationRole.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def organization_role_params
      params.expect(organization_role: [ :name, :user_id, :team_id, :job_description, :status ])
    end
end
