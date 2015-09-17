class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(created_at: :desc)
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question added.'
      redirect_to questions_path
    else
      flash[:error] = @question.errors.full_messages
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = 'Question updated.'
      redirect_to question_path(@question)
    else
      flash[:error] = @question.errors.full_messages
      render :edit
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    flash[:notice] = 'Question deleted.'
    redirect_to questions_path
  end

  private
  def question_params
    p = params.require(:question).permit(:title, :description, :user)
    p[:user] = User.find(p[:user])
    return p
  end
end
