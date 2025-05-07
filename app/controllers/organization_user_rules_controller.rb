class OrganizationUserRulesController < ApplicationController
  before_action :set_organization_user_rule, only: %i[ show edit update destroy ]

  # GET /organization_user_rules or /organization_user_rules.json
  def index
    @organization_user_rules = OrganizationUserRule.all
  end

  # GET /organization_user_rules/1 or /organization_user_rules/1.json
  def show
  end

  # GET /organization_user_rules/new
  def new
    @organization_user_rule = OrganizationUserRule.new
  end

  # GET /organization_user_rules/1/edit
  def edit
  end

  # POST /organization_user_rules or /organization_user_rules.json
  def create
    @organization_user_rule = OrganizationUserRule.new(organization_user_rule_params)

    respond_to do |format|
      if @organization_user_rule.save
        format.html { redirect_to @organization_user_rule, notice: "Organization user rule was successfully created." }
        format.json { render :show, status: :created, location: @organization_user_rule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization_user_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization_user_rules/1 or /organization_user_rules/1.json
  def update
    respond_to do |format|
      if @organization_user_rule.update(organization_user_rule_params)
        format.html { redirect_to @organization_user_rule, notice: "Organization user rule was successfully updated." }
        format.json { render :show, status: :ok, location: @organization_user_rule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization_user_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_user_rules/1 or /organization_user_rules/1.json
  def destroy
    @organization_user_rule.destroy!

    respond_to do |format|
      format.html { redirect_to organization_user_rules_path, status: :see_other, notice: "Organization user rule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_user_rule
      @organization_user_rule = OrganizationUserRule.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def organization_user_rule_params
      params.expect(organization_user_rule: [ :organization_id, :user_id, :rule_id ])
    end
end
