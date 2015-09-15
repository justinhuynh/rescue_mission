class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
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

  private
  def question_params
    p = params.require(:question).permit(:title, :description, :user)
    p[:user] = User.find(p[:user])
    return p
  end
end
