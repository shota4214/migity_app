class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  before_action :basic_auth

  def set_search
    @search = Question.where(draft: false).ransack(params[:q])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name pharmacy])
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :name, :pharmacy, :image, :image_cache, :pharmacist, :admin, :position, :introduction, 
      pharmacist_details_attributes: [
        :id, :office_name, :specialty, :introduction, :other_license, { license_ids: [] },
        { disease_ids: [] }
        ]
      ])
  end

  private

  def basic_auth
    if Rails.env == "production"
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      end
    end
  end
end
