class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]

  # GET /models
  # GET /models.json
  def index
    # @models = Model.all

    @models = Model.where(trademark_id: params[:trademark_id])
    render json: @models
  end

  # GET /models/1
  # GET /models/1.json
  def show
  end

  # GET /models/new
  def new
    @trademark = Trademark.find(params[:trademark_id])
    @model = @trademark.models.new
    @option = "Crear"
  end

  # GET /models/1/edit
  def edit
    @option = "Editar"
  end

  # POST /models
  # POST /models.json
  def create
    @model = Model.new(model_params)
    if @model.save
      flash[:success] = "El modelo #{@model.name} fue agregar exitosamente."
      redirect_to trademark_path(@model.trademark_id)
    else
        if @model.name.empty?
          flash[:danger] = "Debe ingresar un nombre del modelo teléfonico."
        elsif @model.price.empty?
          flash[:danger] = "Debe Ingrese precio máximo a pagar, Ej: 15000."
        else  
          flash[:danger] = "El precio debe ser un numero, Ej: 15000."
        end
        redirect_to trademark_path(@model.trademark_id)
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
   if @model .update(model_params)
      flash[:success] = "El modelo #{@model.name} fue editado exitosamente."
    else
      if @model.name.empty?
        flash[:danger] = "Debe ingresar un nombre del modelo teléfonico."
      elsif @model.price.blank?
        flash[:danger] = "Debe Ingrese precio máximo a pagar, Ej: 15000."
      else  
        flash[:danger] = "El precio debe ser un numero, Ej: 15000."
      end
    end
    redirect_to trademark_path(@model.trademark_id)
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @trademark = Trademark.find(@model.trademark_id)
    if @model.destroy
      flash[:success] = "El modelo #{@model.name} fue eliminado exitosamente."
      redirect_to trademark_path(@trademark.id)
    else
      flash[:danger] = "Hubo problemas para eliminar el modelo #{@model.name}."
      redirect_to trademark_path(@trademark.id)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:model).permit(:name, :price, :trademark_id)
    end
end
