class SellPhonesController < ApplicationController

  def quote_phone
    @trademarks  = Trademark.all
    @states     = State.all
    @models     = Model.where("trademark_id = ?", Trademark.first.id)      
    @buy_detail = BuyDetail.new
  end

  def generate_buy
    @flag = true
    if params[:buy_detail][:state_id].blank? or params[:buy_detail][:model_id].blank?
      @flag = false
      flash[:danger] = "debe ingresar toda la información para continuar."
    end  
    
    if @flag
      @state = State.find(params[:buy_detail][:state_id])
      @model = Model.find(params[:buy_detail][:model_id])
      @total_price = @model.calculate_price(@state.factor)

      if @buy = Buy.create(user: current_user)
        if @buy_detail = @buy.buy_details.create(model: @model, state: @state, price: @total_price)
          flash[:success] = "Bien hecho!! ahora ingrese los datos del cliente."
          redirect_to add_customer_path(buy_id: @buy.id)
        end

      end
    else
      redirect_to quote_phones_path
    end
  end

  def add_customer
    @customer = Customer.new
  end

  def create_customer
    @customer = Customer.new(customer_params)
    @buy = Buy.find(params[:buy_id])

    if @customer.save
      if @buy.update(customer_id: @customer.id)
        flash[:success] = "Excelente!! antes de finalizar la compra, quisas el cliente desea agregar otro teléfono."
        #redirect_to add_customer_path()
      else
        flash[:danger] = "Hubo un problema al asignar un cliente con la compra."
      end
    else
      flash[:danger] = "Hubo un problema al guardar al cliente."
    end
    redirect_to add_customer_path(buy_id: @buy.id)
  end

  def customer_params
    params.require(:customer).permit(:name, :last_name, :rut, :email, :address, :phone)
  end
end