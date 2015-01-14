class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @sucursals = @company.sucursals.order(name: :asc)
  end

  # GET /companies/new
  def new
    @company = Company.new
    @option = 'Guardar'
  end

  # GET /companies/1/edit
  def edit
    @option = 'Editar'
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "La compañia #{@company.name} se ha creado exitosamente."
      redirect_to companies_path
    else
      if @company.name.empty?
        flash[:danger] = "Debe ingresar un nombre de compañia."
      elsif @company.contact_phone.empty?
        flash[:danger] = "Debe ingresar un numero de contacto."
      elsif @company.contact_phone.length != 8
        flash[:danger] = "Debe ingresar 8 digitos, Ej: 68399419."
      else
        flash[:danger] = "Hubo un problema para crear una compañia."
      end
      render :new
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    if @company.update(company_params)
      flash[:success] = "La compañia #{@company.name} se ha editado exitosamente."
      redirect_to companies_path
    else
      if @company.name.empty?
        flash[:danger] = "Debe ingresar un nombre de compañia."
      elsif @company.contact_phone.empty?
        flash[:danger] = "Debe ingresar un numero de contacto."
      elsif @company.contact_phone.length != 8
        flash[:danger] = "Debe ingresar 8 digitos, Ej: 68399419."
      else
        flash[:danger] = "Hubo un problema para crear una compañia."
      end
      render :edit
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @nombre = @company.name
    if @company.destroy
      flash[:success] = "Se ha eliminado la compañia #{@nombre} exitosamente."
    else
      flash[:danger] = "Hubo problemas para eliminar la compañia #{@nombre}"
    end
    redirect_to companies_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :description, :contact_phone)
    end
end
