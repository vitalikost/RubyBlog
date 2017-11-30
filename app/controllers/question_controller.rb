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
    @question.like=0
    if @question.save
      redirect_to @question
    else
      render "new"
    end
  end

  def show
      @question = Question.find(params[:id])

      if cookies[:views].present?
        cookies[:views] = cookies[:views].to_i+1;
      else
        cookies[:views] = {value:1, expires: 1.day.from_now };
      end

      @views = cookies[:views].to_i
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
    id_destroy = @question.id
    if @question.destroy
      Userlike.where(id_question: id_destroy).destroy_all
    end
    redirect_to question_index_path
  end


  def likeup
    @question = Question.find(params[:id])
    @question.like=@question.like+1
    if @question.save
      Userlike.create(id_user: current_user.id, id_question: @question.id,like: 1)
    end
    redirect_to @question
  end

  def likedown
    @question = Question.find(params[:id])
    @question.like=@question.like-1
    if @question.save
      Userlike.where(id_user: current_user.id, id_question: @question.id).destroy_all
    end
    redirect_to @question
  end


  private
  def question_params
    params.require(:question).permit(:title, :text)
  end


end
