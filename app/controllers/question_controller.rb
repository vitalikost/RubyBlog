class QuestionController < ApplicationController

  def edit
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
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

  private
  def question_params
    params.require(:question).permit(:title, :text)
  end


end
