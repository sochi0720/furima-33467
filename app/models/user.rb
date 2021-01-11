class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ンー－]+\z/, message: '全角カタカナを使用してください' } do
    validates :family_name_kana
    validates :first_name_kana
  end

  with_options presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: '半角英数字を使用してください' } do
    validates :password, confirmation: true
  end

  validates :birth_day, presence: true
  validates :nick_name, presence: true
end
