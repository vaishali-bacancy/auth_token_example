# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  def create
    binding.pry
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user && @user.valid_password?(params[:user][:password])
      auth_token = @user.generate_authentication_token
      render json: auth_token
    else
      render json: {:message => 'error', :rstatus=>0}.to_json
    end
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
