class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]
  before_action :different_login_and_category_users, only: %i[show edit]

  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to notes_path, notice: "カテゴリーを作成しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: "カテゴリーを変更しました"
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "カテゴリーを削除しました"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    if Category.exists?(id: params[:id])
      @category = Category.find(params[:id])
    else
      redirect_to categories_path
    end
  end

  def different_login_and_category_users
    redirect_to categories_path unless current_user.id == @category.user_id
  end
end
