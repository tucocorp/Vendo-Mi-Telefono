class BuysController < ApplicationController
  before_action :set_buy, only: [:show, :edit, :update, :destroy, :add_customer, :create_customer, :add_phone, :print_coupon]

  require 'barby'
  require 'barby/barcode/ean_13'
  require 'barby/outputter/html_outputter'
  
  def print_coupon
    if @buy.coupon.update(status: :printed)
      flash[:success] = "El cupón de descuento se ha impreso exitosamente."
    else
      flash[:danger] = "Hubo un problema el imprimir el cupón de descuento."
    end
    redirect_to @buy
  end
  
  def add_phone
    @buy_detail = @buy.buy_details.new
    @trademarks = Trademark.all
    @states     = State.all
    @models     = Model.where("trademark_id = ?", Trademark.first.id)      
  end


  def add_customer
    @customer = Customer.new
  end

  def create_customer
    @customer = Customer.new(customer_params)

    if RUT.validar(customer_params[:rut]) 
      if @customer.save
        @buy.customer_id = @customer.id
        if @buy.save
          flash[:success] = "Excelente!! antes de finalizar la compra, quizas el cliente desea agregar otro teléfono."
          redirect_to @buy
        else
          flash[:danger] = "Hubo un problema al asignar el cliente con la compra realizada."
          redirect_to add_customer_buy_path(@buy.id)
        end
      else
        flash[:danger] = "Debe ingresar todos los datos que se solicitan."
        redirect_to add_customer_buy_path(@buy.id)
      end
    else
  #end unless 
      flash[:danger]= "El rut #{customer_params[:rut]} no es valido"
      redirect_to add_customer_buy_path(@buy.id)
    end
    
  end


  def index
    @buys = Buy.where(status: 1)
  end

  def show
    unless @buy.coupon.nil?
      @barcode = Barby::EAN13.new(@buy.coupon.barcode)
      @barcode_for_html = Barby::HtmlOutputter.new(@barcode)  
    end
    
  end

 
  def new
    @buy        = Buy.new
    @buy.buy_details.new
    
    @trademarks = Trademark.all
    @states     = State.all
    @models     = Model.where("trademark_id = ?", Trademark.first.id)      
  end


  def buy_sucursal
    #raise params[:q].inspect
     @search = Buy.search(member_sucursal_name_cont: params[:q])
     @buys = @search.result.includes(:buy_details).includes(:member).where(status: 1).page(params[:page]).per(10)
     @buy_excel = @search.result.includes(:buy_details).includes(:member).where(status: 1)
      #raise params[:buy].inspect
     respond_to do |format|
     
      format.html
      format.xls { send_data Buy.to_csv(@buy_excel)}
     end
  end
  
  def buy_all
    @buys = Buy.includes(:buy_details).where(status: 1).page(params[:page]).per(10)
    #raise @buy.inspect

    @buy_details = BuyDetail.joins(:buy).where('buys.status = 1')

    respond_to do |format|
      format.html
      #format.csv { send_data @buys.to_csv }
      format.xls { send_data @buy_details.to_csv }
    end    
  end

  def create
    @buy = Buy.new(buy_params)
    
    @buy.member = current_user.members.first


    respond_to do |format|
      if @buy.save
        flash[:success] = "Bien hecho!! ahora ingrese los datos del cliente."
        format.html { redirect_to add_customer_buy_path(@buy.id)}
        format.json { render :show, status: :created, location: @buy }
      else
        flash[:danger] = "Debe ingresar toda la información para continuar."
        format.html { redirect_to new_buy_path}
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
    
  end


  def update
    respond_to do |format|
      if @buy.update(buy_params)
        flash[:success] = "Bien hecho!! Has ingresado otro teléfono."
        #{@buy_detail.model_id} #{@buy_detail.model.name}.
        format.html { redirect_to @buy}
        format.json { render :show, status: :ok, location: @buy }
      else
        flash[:danger] = "Debe ingresar toda la información para continuar."
        format.html { redirect_to add_phone_buy_path(@buy)}
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @buy.destroy
      flash[:success] = "Se ha cancelado la compra exitosamente."
    else
      flash[:danger] = "Hubo problemas para cancelar la compra."
    end
    redirect_to root_path
  end

  private
   
    def set_buy
      @buy = Buy.find(params[:id])
    end

    def buy_params
      params.require(:buy).permit(
        buy_details_attributes: [:model_id, :state_id,:price]
      )
    end

    def customer_params
      params.require(:customer).permit(:name, :last_name, :rut, :email, :address, :phone)
    end
end
