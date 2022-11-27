class TopController < ApplicationController
  before_action :other_than_drafts, only: %i[index search]
  before_action :question_tag_ranks, only: %i[index show by_disease search]
  before_action :sidebar_profession_users, only: %i[index show by_disease search]

  def index
    @questions = @questions.where(resolved: true).order("created_at DESC").page(params[:page]).per(5) if params[:resolved]
    @questions = @questions.where(resolved: false).order("created_at DESC").page(params[:page]).per(5) if params[:unresolved]
  end

  private

  def other_than_drafts
    @questions = Question.where(draft: false).order("created_at DESC").page(params[:page]).per(5)
  end

  def question_tag_ranks
    @question_tag_ranks = Disease.find(DiseaseLabelling.group(:disease_id).order('count(disease_id) desc').pluck(:disease_id))
  end

  def sidebar_profession_users
    @sidebar_profession_users = User.joins(:comments).group("users.id", "comments.best_answer").having("comments.best_answer=true").order("count_all DESC").count
    @sidebar_profession_users  = @sidebar_profession_users.map{|user, value| [User.find(user.first), value]}
  end
end
