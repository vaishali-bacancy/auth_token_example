class ApplicationController < ActionController::Base
	#before_action :set_timezone
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	rescue_from CanCan::AccessDenied do |exception|
	  redirect_to root_path, alert: exception.message
	end

	protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :current_password])
	  end 

	def verify_auth_token
    puts "----here---"
    @auth_token = AuthenticationToken.find_by(auth_token: params[:authentication_token])
    unless @auth_token.present?
      render json: {:message => "Please login to processed further.", :rstatus=>0}.to_json
    else
      @current_user = @auth_token.user
      user = User.find(params[:user_id]) rescue nil if params[:user_id].present?
      @user = user.present? ? user : @current_user
    end
  end
end
