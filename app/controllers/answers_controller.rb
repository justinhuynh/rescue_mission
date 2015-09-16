class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    if @answer.save
      flash[:notice] = 'Answer added.'
      redirect_to question_path(@question)
    else
      flash[:error] = @answer.errors.full_messages.join(" ")
      render :new
    end
  end

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  private
  def answer_params
    p = params.require(:answer).permit(:description, :user)
    p[:user] = User.find(p[:user])
    return p
  end
end
