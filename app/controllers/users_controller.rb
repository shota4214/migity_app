class UsersController < ApplicationController
  before_action :authenticate_user!

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
    @profession_users = User.where(pharmacist: true).order("created_at DESC")
  end
end
