class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_knowledge, only: %i[create edit update choose_answer]

  def create
    @comment = @knowledge.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to knowledge_path(@knowledge), notice: 'コメントできませんでした' }
      end
    end
  end

  def edit
    @comment = @knowledge.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = @knowledge.comments.find(params[:id])
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
    @comment = @knowledge.comments.find(params[:comment_id])
    find_best_answer = Comment.find_by(knowledge_id: @knowledge.id, best_answer: true)
    if find_best_answer.nil?
      @comment.update(best_answer: true)
      redirect_to knowledge_path(@knowledge), notice: "ベストアンサーにしました"
    elsif @comment.id == find_best_answer.id
      @comment.update(best_answer: false)
      redirect_to knowledge_path(@knowledge), notice: "ベストアンサーを取り消しました"
    else
      redirect_to knowledge_path(@knowledge), notice: "ベストアンサーにできるのは1件のみです"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :knowledge_id, :best_answer)
  end

  def set_knowledge
    @knowledge = Knowledge.find(params[:knowledge_id])
  end
end
