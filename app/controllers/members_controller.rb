class MembersController < ApplicationController

  def new
    @user = User.new
    @sucursal = Sucursal.find(params[:sucursal_id])
  end

  def create
    #raise "holi"
    @sucursal = Sucursal.find(params[:sucursal_id])
    @user = User.new(user_params)
    @user.password = @user.rut
    @user.username = @user.full_name
    #raise @user.rut.inspect
    
    if @user.save
      @sucursal.members.create(user: @user, role: :collaborator)
      flash[:success] = "El miembro #{@user.full_name} ha sido creado exitosamente."
      redirect_to sucursal_path(@sucursal.id)
    else
       @user.errors.full_messages.each do |error|
      flash[:danger] = "Hubo un problema al crear un miembro."
       end
      #flash[:danger] = "no se pudo crear el miembro #{@user.full_name}."
      #raise "hola"
      redirect_to new_member_path(sucursal_id: @sucursal.id) 
    end
  end

  def show
    
  end


  def user_params
    params.require(:user).permit(
      :name, :rut, :last_name,
      :email, :address, :contact_number
    )
  end

end