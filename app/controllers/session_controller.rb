class SessionController < ApplicationController


  def index
  end

  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
      else
        flash[:message] = "Sorry, your input was wrong or does not exist, please try again."
        render :new
      end
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end

  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user.id)
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end
