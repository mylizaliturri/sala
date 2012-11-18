class UsuariosController < ApplicationController


  def create
    @user = Usuario.new

    @user.nombre=(params[:usuario][:nombre])
    @user.apellido=(params[:usuario][:apellido])
    @user.perfil=(params[:usuario][:perfil])
    @user.correo=(params[:usuario][:correo])
    @user.clave=(params[:usuario][:clave])
    @user.twitter=(params[:usuario][:twitter])
    @user.autorizado=(params[:usuario][:autorizado])

    if @user.save
      # redirect the user to index
      #redirect_to usuarios_path, notice: 'El usuario fue creado exitosamente'
    else
      # redirect the user to the new method
      #render locations_path
    end
  end

  def show
    @user = Usuario.find(params[:id])
  end

  def index
    @users = Usuario.all
  end

  def destroy
    @user = Usuario.find(params[:id])
    @user.destroy
    redirect_to usuarios_path, notice: 'El usuario fue eliminado.'
  end
end
