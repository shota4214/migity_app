class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @knowledge = Knowledge.find(params[:knowledge_id])
    Favorite.create(user_id: current_user.id, knowledge_id: params[:knowledge_id])
  end

  def destroy
    @knowledge = Knowledge.find(params[:id])
    Favorite.find_by(user_id: current_user.id, knowledge_id: params[:id]).destroy
  end

  def index
    @user = User.find(current_user.id)
    @favorite_knowledges = current_user.favorite_knowledges.order(created_at: :desc)
  end
end
