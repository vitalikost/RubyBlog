class AnswersController < ApplicationController
  #http_basic_authenticate_with name: "vitalik", password: "123", except: [:index, :show]
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user_id = current_user.id
    @answer.commenter = current_user.name
    @answer.save
    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answers = @question.answers.find(params[:id])
    @answers.destroy
    redirect_to question_path(@question)
  end


  private
  def answer_params
    params.require(:answer).permit(:commenter, :body)
  end

end
