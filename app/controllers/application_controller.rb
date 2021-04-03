class ApplicationController < ActionController::Base
# 以下デバッグ問６追記
  before_action :authenticate_user!, except: [:top,:about]
# before_action :authenticate_user!
# 以上デバッグ
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
# 以下デバッグ問１０訂正
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_up_path_for(resource)
    users_path
  end

  # def after_sign_in_path_for(resource)
  #   root_path
  # end

  # def after_sign_out_path_for(resource)
  #   root_path
  # end
# 以上デバッグ

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
