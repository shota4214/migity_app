class KnowledgesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_knowledge, only: %i[show edit update destroy change_resolved]
  before_action :other_than_drafts, only: %i[index search my]
  before_action :diseases, only: %i[new edit create confirm]
  before_action :drugs, only: %i[new edit create confirm]
  before_action :side_effects, only: %i[new edit create confirm]
  before_action :knowledge_tag_ranks, only: %i[index show by_disease by_drug by_side_effect search my]
  before_action :half_width_to_full_width, only: %i[update confirm]
  before_action :sidebar_profession_users, only: %i[index show by_disease by_drug by_side_effect search my tag_index]

  def index
    @knowledges = @knowledges.where(resolved: true).order("created_at DESC").page(params[:page]).per(5) if params[:resolved]
    @knowledges = @knowledges.where(resolved: false).order("created_at DESC").page(params[:page]).per(5) if params[:unresolved]
  end

  def new
    @knowledge = current_user.knowledges.build
  end

  def create
    @knowledge = current_user.knowledges.build(knowledge_params)
    if params[:back]
      render :new
    elsif params[:draft]
      if @knowledge.update(draft: true)
      redirect_to root_path, notice: "Q&Aを下書き保存しました"
      else
        render :new
      end
    elsif @knowledge.save
      redirect_to root_path, notice: "Q&Aを投稿しました"
    else
      render :new
    end
  end

  def show
    @comments = @knowledge.comments
    @comment = @knowledge.comments.build
    @favorite = current_user.favorites.find_by(knowledge_id: @knowledge.id) if user_signed_in?
    @best_answer = Comment.find_by(knowledge_id: @knowledge.id, best_answer: true)
    impressionist(@knowledge, nil, unique: [:ip_address])
  end

  def edit
    if @knowledge.user.id != current_user.id
      redirect_to root_path, alert: "他者の質問は編集できません"
    end
  end

  def update
    if params[:draft]
      @knowledge.update(draft: true)
      if @knowledge.update(@new_knowledge_params)
        redirect_to root_path, notice: "Q&Aを編集し下書き保存しました"
      else
        render :edit
      end
    else
      @knowledge.update(draft: false)
      if @knowledge.update(@new_knowledge_params)
        redirect_to root_path, notice: "Q&Aを編集しました"
      else
        render :edit
      end
    end
  end

  def destroy
    @knowledge.destroy
    redirect_to root_path, notice: "Q&Aを削除しました"
  end

  def confirm
    @knowledge = current_user.knowledges.build(@new_knowledge_params)
    render :new if @knowledge.invalid?
  end

  def change_resolved
    if @knowledge.resolved
      @knowledge.update(resolved: false)
      redirect_to knowledge_path(@knowledge), notice: "Q&Aを回答受付中に変更しました"
    else
      @knowledge.update(resolved: true)
      redirect_to knowledge_path(@knowledge), notice: "Q&Aを解決済みに変更しました"
    end
  end

  def search
    search_words = params[:q][:title_or_content_body_cont].split(/[\p{blank}\s]+/)
    grouping_hash = search_words.reduce({}){|hash, word| hash.merge(word => { title_or_content_body_cont: word})}
    @results = @knowledges.ransack({ combinator: 'and', groupings: grouping_hash, s: 'created_at DESC'}).result.page(params[:page]).per(10)
  end

  def by_disease
    disease_id = params[:format].to_i
    @disease = Disease.find(disease_id)
    @knowledges_by_disease = @disease.knowledges.order("created_at DESC").page(params[:page]).per(10)
  end

  def by_drug
    drug_id = params[:format].to_i
    @drug = Drug.find(drug_id)
    @knowledges_by_drug = @drug.knowledges.order("created_at DESC").page(params[:page]).per(10)
  end

  def by_side_effect
    side_effect_id = params[:format].to_i
    @side_effect = SideEffect.find(side_effect_id)
    @knowledges_by_side_effect = @side_effect.knowledges.order("created_at DESC").page(params[:page]).per(10)
  end

  def my
    @user = User.find(current_user.id)
    @knowledges = @user.knowledges.all.order("created_at DESC")
    if @user.id == current_user.id
      @knowledges = @user.knowledges.all.order("created_at DESC")
    else
      @knowledges = Knowledge.where(user_id: @user, draft: false).order("created_at DESC")
    end
  end

  def tag_index
    @all_disease_tags = Disease.all
    @all_drug_tags = Drug.all
    @all_side_effect_tags = SideEffect.all
  end

  private

  def knowledge_params
    params.require(:knowledge).permit(:title, :content, :resolved, :draft, { disease_ids: [] }, { drug_ids: [] }, { side_effect_ids: [] })
  end

  def set_knowledge
    @knowledge = Knowledge.find(params[:id])
  end

  def other_than_drafts
    @knowledges = Knowledge.where(draft: false).order("created_at DESC").page(params[:page]).per(5)
  end

  def diseases
    @diseases = Disease.all
  end

  def drugs
    @drugs = Drug.all
  end

  def side_effects
    @side_effects = SideEffect.all
  end

  def knowledge_tag_ranks
    @knowledge_diseases_ranks = Disease.find(DiseaseLabelling.group(:disease_id).order('count(disease_id) desc').pluck(:disease_id))
    @knowledge_drugs_ranks = Drug.find(DrugLabelling.group(:drug_id).order('count(drug_id) desc').pluck(:drug_id))
    @knowledge_side_effects_ranks = SideEffect.find(SideEffectLabelling.group(:side_effect_id).order('count(side_effect_id) desc').pluck(:side_effect_id))
    
  end

  def half_width_to_full_width
    @new_knowledge_params = knowledge_params
    @new_knowledge_params[:title] = @new_knowledge_params[:title].gsub(/[\uFF61-\uFF9F]+/) { |str| str.unicode_normalize(:nfkc) }
    @new_knowledge_params[:content] = @new_knowledge_params[:content].gsub(/[\uFF61-\uFF9F]+/) { |str| str.unicode_normalize(:nfkc) }
  end

  def sidebar_profession_users
    @sidebar_profession_users = User.joins(:comments).group("users.id", "comments.best_answer").having("comments.best_answer=true").order("count_all DESC").count
    @sidebar_profession_users  = @sidebar_profession_users.map{|user, value| [User.find(user.first), value]}
  end
end
