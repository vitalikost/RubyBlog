class QuestionController < ApplicationController

  def new
  end

  def create
    @question = Question.new(question_params)

    @question.save
    redirect_to @question

  end

  def show
  #  render html:"Goods add"
    @question = Question.find(params[:id])
  end

  def index

  end

  private
  def question_params
    params.require(:question).permit(:title, :text)
  end

end
