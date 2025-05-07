class TeamUserRulesController < ApplicationController
  before_action :set_team_user_rule, only: %i[ show edit update destroy ]

  # GET /team_user_rules or /team_user_rules.json
  def index
    @team_user_rules = TeamUserRule.all
  end

  # GET /team_user_rules/1 or /team_user_rules/1.json
  def show
  end

  # GET /team_user_rules/new
  def new
    @team_user_rule = TeamUserRule.new
  end

  # GET /team_user_rules/1/edit
  def edit
  end

  # POST /team_user_rules or /team_user_rules.json
  def create
    @team_user_rule = TeamUserRule.new(team_user_rule_params)

    respond_to do |format|
      if @team_user_rule.save
        format.html { redirect_to @team_user_rule, notice: "Team user rule was successfully created." }
        format.json { render :show, status: :created, location: @team_user_rule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team_user_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_user_rules/1 or /team_user_rules/1.json
  def update
    respond_to do |format|
      if @team_user_rule.update(team_user_rule_params)
        format.html { redirect_to @team_user_rule, notice: "Team user rule was successfully updated." }
        format.json { render :show, status: :ok, location: @team_user_rule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team_user_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_user_rules/1 or /team_user_rules/1.json
  def destroy
    @team_user_rule.destroy!

    respond_to do |format|
      format.html { redirect_to team_user_rules_path, status: :see_other, notice: "Team user rule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_user_rule
      @team_user_rule = TeamUserRule.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def team_user_rule_params
      params.expect(team_user_rule: [ :team_id, :user_id, :rule_id ])
    end
end
