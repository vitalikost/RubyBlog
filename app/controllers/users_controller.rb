class UsersController < ApplicationController
  def new
    @user =User.new
  end

  def create
      @user =User.new(params.require(:user).permit(:name, :email,:password))
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to users_new_path
    end
  end


  def show
    @user = User.find(params[:id])
    @question = Question.where(id:@user)
  end

end
