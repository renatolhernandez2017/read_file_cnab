# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    if params[:user].present?
      user = User.find_by(email: params[:user][:email])

      if user.present? && user.valid_password?(params[:user][:password])
        sign_in(user)
        redirect_to admin_root_path
      else
        redirect_to user_session_path
      end
    else
      super
    end
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    sign_out current_user
    redirect_to user_session_path, notice: "Signed out successfully."
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
