# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    @diseases = Disease.all
    @licenses = License.all
    unless @user.expert_details.present?
      @expert_details = @user.expert_details.build
    end
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end

  def after_sign_in_path_for(resource)
    category_samples = ["口内炎", "悪心嘔吐", "過敏症", "インフュージョンリアクション", "アナフィキシー"]
    category_samples.each do |category|
      Category.create(name: category, user_id: current_user.id)
    end
    top_about_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :name, :pharmacy, :image, :image_cache, :pharmacist, :admin, :position, :introduction, 
      expert_details_attributes: [
        :id, :office_name, :specialty, :introduction, :other_license, { license_ids: [] },
        { disease_ids: [] }
        ]
      ])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
