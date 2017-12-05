class AnswersController < ApplicationController
  #http_basic_authenticate_with name: "vitalik", password: "123", except: [:index, :show]
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user_id = current_user.id
    @answer.commenter = current_user.name
    @answer.save

    respond_to do |format|
      format.html {redirect_to question_path(@question)}
      format.js
      format.json { render json:  @answer.as_json}
    end

  end

  def destroy
    @question = Question.find(params[:question_id])
    @answers = @question.answers.find(params[:id])
    @answers.destroy
    respond_to do |format|
      format.html {redirect_to question_path(@question)}
      format.js
      format.json
    end
  end


  private
  def answer_params
    params.require(:answer).permit(:commenter, :body)
  end

end
