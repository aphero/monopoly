class GameBanksController < ApplicationController
  before_action :set_game_bank, only: [:show, :edit, :update, :destroy]

  def dashboard
    @game_banks = GameBank.all
  end
  # GET /game_banks
  def index
    @game_banks = GameBank.all
  end

  # GET /game_banks/1
  def show
  end

  # GET /game_banks/new
  def new
    @game_bank = GameBank.new
  end

  # GET /game_banks/1/edit
  def edit
  end

  # POST /game_banks
  def create
    @game_bank = GameBank.new(game_bank_params)

    if @game_bank.save
      redirect_to @game_bank, notice: 'Game bank was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /game_banks/1
  def update
    if @game_bank.update(game_bank_params)
      redirect_to @game_bank, notice: 'Game bank was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /game_banks/1
  def destroy
    @game_bank.destroy
    redirect_to game_banks_url, notice: 'Game bank was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_bank
      @game_bank = GameBank.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_bank_params
      params.require(:game_bank).permit(:party, :description, :trans_type, :amount)
    end
end
