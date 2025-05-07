class TeamRulesController < ApplicationController
  before_action :set_team_rule, only: %i[ show edit update destroy ]

  # GET /team_rules or /team_rules.json
  def index
    @team_rules = TeamRule.all
  end

  # GET /team_rules/1 or /team_rules/1.json
  def show
  end

  # GET /team_rules/new
  def new
    @team_rule = TeamRule.new
  end

  # GET /team_rules/1/edit
  def edit
  end

  # POST /team_rules or /team_rules.json
  def create
    @team_rule = TeamRule.new(team_rule_params)

    respond_to do |format|
      if @team_rule.save
        format.html { redirect_to @team_rule, notice: "Team rule was successfully created." }
        format.json { render :show, status: :created, location: @team_rule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_rules/1 or /team_rules/1.json
  def update
    respond_to do |format|
      if @team_rule.update(team_rule_params)
        format.html { redirect_to @team_rule, notice: "Team rule was successfully updated." }
        format.json { render :show, status: :ok, location: @team_rule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_rules/1 or /team_rules/1.json
  def destroy
    @team_rule.destroy!

    respond_to do |format|
      format.html { redirect_to team_rules_path, status: :see_other, notice: "Team rule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_rule
      @team_rule = TeamRule.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def team_rule_params
      params.expect(team_rule: [ :team_id, :rule_id, :active ])
    end
end
