class OrganizationRulesController < ApplicationController
  before_action :set_organization_rule, only: %i[ show edit update destroy ]

  # GET /organization_rules or /organization_rules.json
  def index
    @organization_rules = OrganizationRule.all
  end

  # GET /organization_rules/1 or /organization_rules/1.json
  def show
  end

  # GET /organization_rules/new
  def new
    @organization_rule = OrganizationRule.new
  end

  # GET /organization_rules/1/edit
  def edit
  end

  # POST /organization_rules or /organization_rules.json
  def create
    @organization_rule = OrganizationRule.new(organization_rule_params)

    respond_to do |format|
      if @organization_rule.save
        format.html { redirect_to @organization_rule, notice: "Organization rule was successfully created." }
        format.json { render :show, status: :created, location: @organization_rule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization_rules/1 or /organization_rules/1.json
  def update
    respond_to do |format|
      if @organization_rule.update(organization_rule_params)
        format.html { redirect_to @organization_rule, notice: "Organization rule was successfully updated." }
        format.json { render :show, status: :ok, location: @organization_rule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_rules/1 or /organization_rules/1.json
  def destroy
    @organization_rule.destroy!

    respond_to do |format|
      format.html { redirect_to organization_rules_path, status: :see_other, notice: "Organization rule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_rule
      @organization_rule = OrganizationRule.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def organization_rule_params
      params.expect(organization_rule: [ :organization_id, :rule_id, :active ])
    end
end
