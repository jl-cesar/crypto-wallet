class CoinsController < ApplicationController

  before_action :set_coin, only: [:show, :edit, :update, :destroy]
  before_action :set_MiningTypes_Options, only: [:new, :edit, :create, :update]

  # GET /coins
  # GET /coins.json
  def index
    @coins = Coin.all
  end

  # GET /coins/1
  # GET /coins/1.json
  def show
  end

  # GET /coins/new
  def new
    @coin = Coin.new
  end

  # GET /coins/1/edit
  def edit
  end

  # POST /coins
  # POST /coins.json
def create
  if @coin = Coin.new(coin_params)
    respond_to do |format|
      if @coin.save
        format.html { redirect_to @coin, notice: 'Moeda criada com sucesso.' }
        format.json { render :show, status: :created, location: @coin }
      else
        format.html { render :new }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end
end

  # PATCH/PUT /coins/1
  # PATCH/PUT /coins/1.json
  def update
    respond_to do |format|
      if @coin.update(coin_params)
        format.html { redirect_to @coin, notice: 'Moeda atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @coin }
      else
        format.html { render :edit }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coins/1
  # DELETE /coins/1.json
  def destroy
    @coin.destroy
    respond_to do |format|
      # CRIA O FORMATO DA RESPOSTA PARA RETORNO PADRAO EM HTML
      format.html { redirect_to coins_url, notice: 'Moeda apagada com sucesso.' }
      # CRIA O FORMATO DA RESPOSTA PARA RETORNO EM JSON
      format.json { head :no_content }
    end
  end

  private
    # RECEBE O :ID RECEBIDO E SETA @COIN
    def set_coin
      @coin = Coin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coin_params     
        params.require(:coin).permit(:descripition, :acronym, :url_image, :mining_type_id) # FILTRA OS PARAMS E BUSCA APENAS OS LISTADOS
    end

    def set_MiningTypes_Options
      @mining_types_options = MiningType.all.pluck(:description,:id)
    end

end
