module SessionsHelper

    #受け取ったユーザーがログイン中のユーザーと一致すればtrueを返す
    def current_user?(user)
        user == current_user
    end

    # ユーザーがログインしていればtrue、その他ならfalseを返す
    def logged_in?
    !current_user.nil?
    end
end