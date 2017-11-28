class SessionController < ApplicationController
  def login
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to session_login_path
    end
  end

end
