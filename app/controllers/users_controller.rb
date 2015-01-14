class UsersController < ApplicationController

  before_filter :set_user, only: [:lock, :unlock, :edit, :update, :add_to_project]

  def index
    
    @users = User.all
    
    respond_to do |format|
      format.html do 
        render @user
      end 
      format.json do
        @user = User.where(email: params[:email]).first
        render json: @user 
      end
    end
  end

  def show
    render json: @user
  end
  
  def new
    @user = User.new
    @sucursal_id = params[:sucursal_id]
  end

  def create
    @user = User.new(user_params)
    @sucursal = Sucursal.find(params[:sucursal_id])
    raise @user.inspect

    respond_to do |format|
      format.html do 
        if @user.save
            @sucursal.members.create(user: @user, role: :collaborator)
          flash[:success] = 'Usuario creado exitosamente'
          redirect_to users_path
        else
          flash[:danger] = 'No se pudo crear el usuario'
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
    
  end

  def update
    options = params.key?(:update_password) ? password_params : user_params
    if @user.update_attributes(options)
      flash[:success] = 'Usuario actualizado exitosamente.'
      redirect_to users_path
    else
      flash[:danger] = 'No se pudo actualizar el usuario.'
      render 'edit'
    end
  end

  def lock
    if current_user == @user
      flash[:danger] = 'No puedes bloquear tu cuenta.'
      redirect_to(users_path) and return
    end

    if @user.lock_access!(send_instructions: false)
      flash[:success] = 'Usuario bloqueado exitosamente.'
    else
      flash[:danger] = 'No se pudo bloquear el usuario.'
    end

    redirect_to users_path
  end

  def unlock
    if @user.unlock_access!
      flash[:success] = 'Usuario habilitado exitosamente.'
    else
      flash[:danger] = 'No se pudo habilitar el usuario.'
    end

    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:user_id] || params[:id])
  end

  def user_params
    params.require(:user).permit(
      :username, :name, :last_name, :email,
      :position, :address, :rut,
      :contact_number, :resposible_name,
      :password, :password_confirmation
    )
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def update_params
    params.require(:user).permit(
     :username, :name, :last_name, :email,
      :position, :address, :rut,
      :contact_number, :resposible_name,
      :password, :password_confirmation
    )
  end

end
