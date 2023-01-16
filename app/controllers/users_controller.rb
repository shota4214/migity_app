class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :question_tag_ranks, only: %i[index specialty_pharmacist_show]
  before_action :sidebar_profession_users, only: %i[index specialty_pharmacist_show]



  def show
    @user = User.find(params[:id])
    @questions = @user.questions.all.order("created_at DESC")
    if @user.id == current_user.id
      @questions = @user.questions.all.order("created_at DESC")
    else
      @questions = Question.where(user_id: @user, draft: false).order("created_at DESC")
    end
  end

  def index
    @specialty_pharmacist_users = User.where(pharmacist: true).order("created_at DESC").page(params[:page]).per(10)
  end

  def specialty_pharmacist_show
    @specialty_pharmacist = User.find(params[:id])
    @specialty_pharmacist.pharmacist_details.each do |detail|
      @specialty_pharmacist_details = detail
      @specialty_pharmacist_licenses = detail.licenses
    end
  end

  private

  def question_tag_ranks
    @question_diseases_ranks = Disease.find(DiseaseLabelling.group(:disease_id).order('count(disease_id) desc').pluck(:disease_id))
    @question_drugs_ranks = Drug.find(DrugLabelling.group(:drug_id).order('count(drug_id) desc').pluck(:drug_id))
    @question_side_effects_ranks = SideEffect.find(SideEffectLabelling.group(:side_effect_id).order('count(side_effect_id) desc').pluck(:side_effect_id))
  end

  def sidebar_profession_users
    @sidebar_profession_users = User.joins(:comments).group("users.id", "comments.best_answer").having("comments.best_answer=true").order("count_all DESC").count
    @sidebar_profession_users  = @sidebar_profession_users.map{|user, value| [User.find(user.first), value]}
  end
end
