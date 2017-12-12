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

  def addfavorite

    @question = Question.find(params[:id_question])
    @user = User.find(params[:id_user])
    if Favorite.where(id_question:@question,id_user:@user ).length == 0
      @favorite = Favorite.new
      @favorite.id_user=@user.id
      @favorite.id_question=@question.id
      @favorite.save
    end

    respond_to do |format|
      format.html {redirect_to @question}
      format.js
      format.json { render json:  @question.as_json}
    end

  end

  def removefavorite
    @question = Question.find(params[:id_question])
    @user = User.find(params[:id_user])
    Favorite.where(id_question:@question,id_user:@user ).destroy_all

    respond_to do |format|
      format.html {redirect_to @question}
      format.js
      format.json { render json:  @question.as_json}
    end


  end

end
