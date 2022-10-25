class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_question, only: %i[show edit update destroy change_resolved]
  before_action :set_q, only: %i[index search]
  before_action :other_than_drafts, only: %i[index search]

  def index
    @questions = @questions.where(resolved: true) if params[:resolved]
    @questions = @questions.where(resolved: false) if params[:unresolved]
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if params[:back]
      render :new
    elsif params[:draft]
      if @question.update(draft: true)
      redirect_to questions_path, notice: "Q&Aを下書き保存しました"
      else
        render :new
      end
    elsif @question.save
      redirect_to questions_path, notice: "Q&Aを投稿しました"
    else
      render :new
    end
  end

  def show
    @comments = @question.comments
    @comment = @question.comments.build
  end

  def edit
  end

  def update
    if params[:draft]
      @question.update(draft: true)
      if @question.update(question_params)
        redirect_to questions_path, notice: "Q&Aを編集し下書き保存しました"
      else
        render :edit
      end
    else
      @question.update(draft: false)
      if @question.update(question_params)
        redirect_to questions_path, notice: "Q&Aを編集しました"
      else
        render :edit
      end
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: "Q&Aを削除しました"
  end

  def confirm
    @question = current_user.questions.build(question_params)
    render :new if @question.invalid?
  end

  def change_resolved
    if @question.resolved
      @question.update(resolved: false)
      redirect_to question_path(@question), notice: "Q&Aを回答受付中に変更しました"
    else
      @question.update(resolved: true)
      redirect_to question_path(@question), notice: "Q&Aを解決済みに変更しました"
    end
  end

  def search
    search_words = params[:q][:title_or_content_body_cont].split(/[\p{blank}\s]+/)
    grouping_hash = search_words.reduce({}){|hash, word| hash.merge(word => { title_or_content_body_cont: word})}
    @results = @questions.ransack({ combinator: 'or', groupings: grouping_hash, s: 'created_at desc'}).result
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :resolved, :draft)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def set_q
    @q = Question.ransack(params[:q])
  end

  def other_than_drafts
    @questions = Question.where(draft: false)
  end
end
