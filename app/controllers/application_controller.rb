class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 

  def after_sign_in_path_for(resource)
    show_path
  end

  private

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up,keys:[:email]) 
    end

    def sign_in_required
        redirect_to new_user_session_url unless user_signed_in?
    end

    #受け取ったユーザーがログイン中のユーザーと一致すればtrueを返す
    def current_user?(user)
        user == current_user
    end

    # ユーザーがログインしていればtrue、その他ならfalseを返す
    def logged_in?
    !current_user.nil?
    end

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        redirect_to root_path
      end
    end
end