class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create, :search]
  respond_to :html, :json

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id

      Twitter.update("@"+@user.twitter+" bienvenido al sistema de reservas")
      redirect_to root_url, :notice => "Thank you for signing up! You are now logged in."
    else
      render :action => 'new'
    end
  end

  def search
    if params[:screen_name]
    #respond_with(params[:screen_name])
      @user=User.find_by_twitter(params[:screen_name])
      if @user
        respond_with(@user)
      else
        objeto=User.new()
        objeto[:lastname]="novalido"
        objeto[:name]="novalido"
        respond_with(objeto)
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end

  def buscar
#    quien=params[:twitter]
#    usuario=User.find_by_twitter.to_Json
  end
end
