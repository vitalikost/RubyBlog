class QuestionController < ApplicationController
 # http_basic_authenticate_with name: "vitalik", password: "123", only: :destroy
  def edit
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to @question
    else
      render "new"
    end
  end

  def show
      @question = Question.find(params[:id])
  end

  def index
    @question = Question.all
  end


  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end


  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to question_index_path
  end


  def likeup
    @question = Question.find(params[:id])
    @question.like=@question.like+1
    @question.save
    redirect_to @question
  end

  def likedown
    @question = Question.find(params[:id])
    @question.like=@question.like-1
    @question.save
    redirect_to @question
  end


  private
  def question_params
    params.require(:question).permit(:title, :text)
  end


end
