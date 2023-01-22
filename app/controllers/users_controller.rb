class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :knowledge_tag_ranks, only: %i[index expert_show]
  before_action :sidebar_profession_users, only: %i[index expert_show]



  def show
    @user = User.find(params[:id])
    @knowledges = @user.knowledges.all.order("created_at DESC")
    if @user.id == current_user.id
      @knowledges = @user.knowledges.all.order("created_at DESC")
    else
      @knowledges = Knowledge.where(user_id: @user, draft: false).order("created_at DESC")
    end
  end

  def index
    @expert_users = User.where(expert: true).order("created_at DESC").page(params[:page]).per(10)
  end

  def expert_show
    @expert = User.find(params[:id])
    @expert.expert_details.each do |detail|
      @expert_details = detail
      @expert_licenses = detail.licenses
    end
  end

  private

  def knowledge_tag_ranks
    @knowledge_diseases_ranks = Disease.find(DiseaseLabelling.group(:disease_id).order('count(disease_id) desc').pluck(:disease_id))
    @knowledge_drugs_ranks = Drug.find(DrugLabelling.group(:drug_id).order('count(drug_id) desc').pluck(:drug_id))
    @knowledge_side_effects_ranks = SideEffect.find(SideEffectLabelling.group(:side_effect_id).order('count(side_effect_id) desc').pluck(:side_effect_id))
  end

  def sidebar_profession_users
    @sidebar_profession_users = User.joins(:comments).group("users.id", "comments.best_answer").having("comments.best_answer=true").order("count_all DESC").count
    @sidebar_profession_users  = @sidebar_profession_users.map{|user, value| [User.find(user.first), value]}
  end
end
