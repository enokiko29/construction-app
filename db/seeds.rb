# メインのサンプルユーザーを1人作成する
User.create!(
    name:  "Example User",
    email: "example@railstutorial.org",
    password:    "foobar",
    password_confirmation: "foobar")

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  password_confirmation = "password"
  reset_password_token= "example-#{n+1}passwordtoken"
  User.create!(
    name:  name,
    email: email,
    password:    password,
    password_confirmation: password,
    reset_password_token: reset_password_token,
    reset_password_sent_at: "2022-01-01 00:00:00",
    remember_created_at: "2022-01-01 00:00:00",
    created_at: "2022-01-01 00:00:00",
    updated_at: "2022-01-01 00:00:00"
    )
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

# 以下のリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }