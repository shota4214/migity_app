class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  before_action :diseases_count

  def set_search
    @search = Question.where(draft: false).ransack(params[:q])
  end

  def diseases_count
    questions = Question.where(draft: false)
    @question_diseases = questions.joins(:disease).group("diseases.id").order('count_all DESC').count
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name pharmacy])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name pharmacy image image_cache pharmacist admin position])
  end
end
