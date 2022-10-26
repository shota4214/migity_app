class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    Favorite.create(user_id: current_user.id, question_id: params[:question_id])
  end

  def destroy
    @question = Question.find(params[:id])
    Favorite.find_by(user_id: current_user.id, question_id: params[:id]).destroy
  end

  def index
    @favorite_questions = current_user.favorite_questions.order(created_at: :desc)
  end
end
