class Users::SessionsController < Devise::SessionsController
    def guest_sign_in
      # userにguestを代入
      user = User.guest
      # userでサインイン
      sign_in user
      # サインイン後の遷移先を指定
      redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
    end
  end