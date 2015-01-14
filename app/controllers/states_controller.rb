class StatesController < ApplicationController
  before_action :set_state, only: [:show, :edit, :update, :destroy]

  # GET /states
  # GET /states.json
  def index
    @states = State.all.order(factor: :desc)
  end

  # GET /states/1
  # GET /states/1.json
  def show
    render json: @state
  end

  # GET /states/new
  def new
    @state = State.new
    @option = 'Nuevo'
  end

  # GET /states/1/edit
  def edit
    @option = 'Editar'
  end

  # POST /states
  # POST /states.json
  def create
    @state = State.new(state_params)

    respond_to do |format|
      if @state.save
          flash[:success] = "El estado #{@state.name} fue creado exitosamente."
        format.html { redirect_to states_path}
        format.json { render :show, status: :created, location: @state }
      else
          if @state.name.empty?
            flash[:danger] = "Debe ingresar un nombre de estado, Ej: Operativo."
          elsif @state.factor.empty?
            flash[:danger] = "Debe ingresar el factor que paga por el estado, Ej: 40"
          else
            flash[:danger] = "El factor debe ser un numero, Ej: 40"
          end
        format.html { render :new }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /states/1
  # PATCH/PUT /states/1.json
  def update
    respond_to do |format|
      if @state.update(state_params)
        flash[:success] = "El estado #{@state.name} fue editado exitosamente."
        format.html { redirect_to states_path}
        format.json { render :show, status: :created, location: @state }
      else
          if @state.name.empty?
            flash[:danger] = "Debe ingresar un nombre de estado, Ej: Operativo."
          elsif @state.factor.empty?
            flash[:danger] = "Debe ingresar el factor que paga por el estado, Ej: 40"
          else
            flash[:danger] = "El factor debe ser un numero, Ej: 40"
          end
        format.html { render :edit }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /states/1
  # DELETE /states/1.json
  def destroy
    nombre = @state.name
    
    if @state.destroy
      flash[:success] = "El estado #{nombre} fue eliminado exitosamente."
    else
      flash[:danger] = "Hubo problemas para eliminar el estado #{nombre}."
    end
    redirect_to states_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def state_params
      params.require(:state).permit(:name, :factor)
    end
end
