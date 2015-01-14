class BuyDetailsController < ApplicationController
  before_action :set_buy_detail, only: [:show, :edit, :update, :destroy]

  # GET /buy_details
  # GET /buy_details.json
  def index
    @buy_details = BuyDetail.all
  end

  # GET /buy_details/1
  # GET /buy_details/1.json
  def show
  end

  # GET /buy_details/new
  def new
    @buy_detail = BuyDetail.new
  end

  # GET /buy_details/1/edit
  def edit
  end

  # POST /buy_details
  # POST /buy_details.json
  def create

    raise params[:buy_details][:state_id].inspect

    @flag = true
    if params[:buy_details][:state_id].blank? or params[:buy_details][:model_id].blank?
      @flag = false
      flash[:danger] = "debe ingresar toda la información para continuar."
    end  
    if @flag
      @buy = Buy.find(params[:buy_id]) 
      @buy_detail = @buy.buy_details.new(buy_detail_params)
      @buy_detail.price = @model.calculate_price(@buy_detail.state.factor)

      respond_to do |format|
        if @buy_detail.save
          format.html { redirect_to @buy_detail.buy}
          flash[:success] = "Bien hecho!! Has ingresado el teléfono #{@buy_detail.model.trademark.name} #{@buy_detail.model.name}"
          format.json { render :show, status: :created, location: @buy_detail }
        else
          format.html { render :new }
          format.json { render json: @buy_detail.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /buy_details/1
  # PATCH/PUT /buy_details/1.json
  def update
    
    respond_to do |format|
      if @buy_detail.update(buy_detail_params)
        format.html { redirect_to @buy_detail, notice: 'Buy detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @buy_detail }
      else
        format.html { render :edit }
        format.json { render json: @buy_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buy_details/1
  # DELETE /buy_details/1.json
  def destroy
    @buy = Buy.find(@buy_detail.buy)
    if @buy.buy_details.count > 1 
      @buy_detail.destroy
      flash[:success] = "El teléfono ha sido quitado de la compra exitosamente."
    else
      flash[:danger] = "Debes tener al menos un teléfono para ejecutar esta compra."
    end
    redirect_to @buy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy_detail
      @buy_detail = BuyDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buy_detail_params
      params.require(:buy_detail).permit(:model_id, :buy_id, :state_id, :imei, :price)
    end
end
