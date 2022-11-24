class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: %i[create edit update choose_answer]

  def create
    @comment = @question.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to question_path(@question), notice: 'コメントできませんでした' }
      end
    end
  end

  def edit
    @comment = @question.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = @question.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの編集に失敗しました'
        format.js { render :edit }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントを削除しました'
      format.js { render :index }
    end
  end

  def choose_answer
    @comment = @question.comments.find(params[:comment_id])
    find_best_answer = Comment.find_by(question_id: @question.id, best_answer: true)
    if find_best_answer.nil?
      @comment.update(best_answer: true)
      redirect_to question_path(@question), notice: "ベストアンサーにしました"
    elsif @comment.id == find_best_answer.id
      @comment.update(best_answer: false)
      redirect_to question_path(@question), notice: "ベストアンサーを取り消しました"
    else
      redirect_to question_path(@question), notice: "ベストアンサーにできるのは1件のみです"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :question_id, :best_answer)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
