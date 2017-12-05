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
        cookies[:views] = {value:1, expires: 24.hour.from_now };
      end

      @views = cookies[:views].to_i

      respond_to do |format|
        format.html
        format.js
        format.json { render json:  @question.as_json}
      end

  end

  def index
    @question = Question.all
    if params[:sort] == 'like'
      @question = Question.all.order(:like);
    end

    if params[:sort] == 'question'
      @question = Question.all.order(:title);
    end

    if params[:sort] == 'user'
      @question = Question.all.order(:user_id);
    end

    if params[:sort] == 'datetime'
      @question = Question.all.order(:created_at);
    end

    respond_to do |format|
        format.html
        format.js
        format.json { render json:  @question.as_json}
      end
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

    respond_to do |format|
      format.html {redirect_to @question}
      format.js
      format.json { render json:  @question.as_json}
    end


  end

  def likedown
    @question = Question.find(params[:id])
    @question.like=@question.like-1
    if @question.save
      Userlike.where(id_user: current_user.id, id_question: @question.id).destroy_all
    end

    respond_to do |format|
      format.html {redirect_to @question}
      format.js
      format.json { render json:  @question.as_json}
    end

  end


  private
  def question_params
    params.require(:question).permit(:title, :text)
  end


end
