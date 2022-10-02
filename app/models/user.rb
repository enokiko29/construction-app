class User < ApplicationRecord
  has_many :microposts, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

    before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }

 # 試作feedの定義
  # 完全な実装は次章の「ユーザーをフォローする」を参照
  def feed
    Micropost.where("user_id = ?", id)
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
end
