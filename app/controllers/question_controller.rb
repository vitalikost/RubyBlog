class QuestionController < ApplicationController

  def new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
    else
      render "new"
    end
    redirect_to @question

  end

  def show
  #  render html:"Goods add"
    @question = Question.find(params[:id])
  end

  def index
    @question = Question.all
  end

  private
  def question_params
    params.require(:question).permit(:title, :text)
  end

end
