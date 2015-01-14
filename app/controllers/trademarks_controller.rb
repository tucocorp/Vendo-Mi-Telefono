class TrademarksController < ApplicationController
  before_action :set_trademark, only: [:show, :edit, :update, :destroy]

  # GET /trademarks
  # GET /trademarks.json
  def index
    @trademarks = Trademark.all
  end

  # GET /trademarks/1
  # GET /trademarks/1.json
  def show
    @models = @trademark.models.order(name: :asc)
  end

  # GET /trademarks/new
  def new
    @option = 'Nuevo'
    @trademark = Trademark.new
  end

  # GET /trademarks/1/edit
  def edit
    @option = 'Editar'
  end

  # POST /trademarks
  # POST /trademarks.json
  def create
    @trademark = Trademark.new(trademark_params)
    if @trademark.save
      flash[:success] = "La marca de teléfonos #{@trademark.name} fue creado exitosamente."
      redirect_to trademarks_path()
    else
      if @trademark.name.empty?
        flash[:danger] = "Debe ingresar un nombre de marca de teléfono."
      else
        flash[:danger] = "Hubo problemas para agregar una marca teléfonica."  
      end
      redirect_to new_trademark_path()
    end
    
  end

  # PATCH/PUT /trademarks/1
  # PATCH/PUT /trademarks/1.json
  def update
    if @trademark.update(trademark_params)
      flash[:success] = "La marca de teléfonos #{@trademark.name} fue editado exitosamente." 
    else
      flash[:danger] = "Hubo problemas para editar la marca #{@trademark.name}."
    end
    redirect_to trademarks_path()
  end

  # DELETE /trademarks/1
  # DELETE /trademarks/1.json
  def destroy
    if @trademark.destroy
      flash[:success] = "La marca de teléfonos #{@trademark.name} fue eliminado exitosamente." 
    else
      flash[:danger] = "Hubo problemas para eliminar la marca #{@trademark.name}."
    end
    redirect_to trademarks_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trademark
      @trademark = Trademark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trademark_params
      params.require(:trademark).permit(:name)
    end
end
