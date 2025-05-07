class ContactCardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact_card, only: %i[ show edit update destroy ]

  # GET /contact_cards or /contact_cards.json
  def index
    @contact_cards = ContactCard.all
  end

  # GET /contact_cards/1 or /contact_cards/1.json
  def show
  end

  # GET /contact_cards/new
  def new
    @contact_card = ContactCard.new
  end

  # GET /contact_cards/1/edit
  def edit
  end

  # POST /contact_cards or /contact_cards.json
  def create
    @contact_card = ContactCard.new(contact_card_params)

    respond_to do |format|
      if @contact_card.save
        format.html { redirect_to @contact_card, notice: "Contact card was successfully created." }
        format.json { render :show, status: :created, location: @contact_card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_cards/1 or /contact_cards/1.json
  def update
    respond_to do |format|
      if @contact_card.update(contact_card_params)
        format.html { redirect_to @contact_card, notice: "Contact card was successfully updated." }
        format.json { render :show, status: :ok, location: @contact_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_cards/1 or /contact_cards/1.json
  def destroy
    @contact_card.destroy!

    respond_to do |format|
      format.html { redirect_to contact_cards_path, status: :see_other, notice: "Contact card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_card
      @contact_card = ContactCard.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def contact_card_params
      params.expect(contact_card: [ :first_name, :last_name, :full_name, :company, :city, :state, :congressional_district, :county, :is_me, :organization_id, :user_id, :birthday, :birth_date, :birth_year, :email_primary, :email_secondary, :phone_mobile, :phone_secondary, :signal_username, :discord_username, :discord_server, :url, :favorite_movie, :favorite_color, :favorite_coffee, :favorite_cocktail, :vip, :politician, :donor, :needs_attention, :notes, :history ])
    end
end
