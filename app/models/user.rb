class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #半角英数混合
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,
                              message: "is invalid. Include both letters and numbers" }
  
  validates :nickname, presence: true
  validates :birthday, presence: true

  #全角のみ
  with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/,
                                      message: 'is invalid. Input full-width characters' } do
    validates :family_name
    validates :last_name
  end

  #カタカナのみ
  with_options presence: true, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/,
                                      message: 'is invalid. Input full-width katakana characters' } do
    validates :last_name_kana
    validates :family_name_kana
  end
end
