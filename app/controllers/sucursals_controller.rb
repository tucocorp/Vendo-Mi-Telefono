class SucursalsController < ApplicationController
  before_action :set_company, only: [:new, :create]
  before_action :set_sucursal, only: [:show, :edit, :update, :destroy]

def index
 @sucursals = Sucursal.all
end

def new
  @sucursal = @company.sucursals.new
  @option = 'Agregar'
end
def show
  @members = @sucursal.members
end
def create
  @sucursal = @company.sucursals.new(sucursal_params)
  @user = User.new(username: @sucursal.name, email: @sucursal.email, address: @sucursal.address, contact_number: @sucursal.contact_number, password: @sucursal.email)

  respond_to do |format|
    format.html do 
      if @sucursal.save
        if @user.save
          # raise @user.password.inspect
          @sucursal.members.create(user: @user, role: :collaborator)
          flash[:success] = "La sucursal #{@user.username} ha sido creada exitosamente."
          redirect_to @company
        else
          flash[:danger] = "Hubo un problema al crear una sucursal."
          render :new
        end  
      else
        flash[:danger] = "Hubo un problema al crear una sucursal."
        render :new
      end
    end 
    format.json do
      if @user.save
        render json: @user 
      end
    end
  end
end

def edit
  @option = 'Editar'
end

def update
  respond_to do |format|
      if @sucursal.update(sucursal_params)
        format.html { redirect_to company_path(@sucursal.company_id) }
        flash[:success] = "La sucursal #{@sucursal.name} ha sido actualizada exitosamente."
        format.json { render :show, status: :ok, location: @sucursal }
      else
        flash[:danger] = "Hubo un problema al editar la sucursal #{@sucursal.name}."
        format.html { render :edit }
        format.json { render json: @sucursal.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
    sucursal = @sucursal
    
    if @sucursal.destroy
      flash[:success] = "La sucursal #{@sucursal.name} ha sido eliminada exitosamente."
    else
      flash[:danger] = "La sucursal #{@sucursal.name} ha sido eliminada exitosamente."
    end
    respond_to do |format|
      format.html { redirect_to company_path(@id) }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_sucursal
    @sucursal = Sucursal.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def sucursal_params
    params.require(:sucursal).permit(
      :name, :address, :contact_number,
      :email,:responsible_name)
  end  

end