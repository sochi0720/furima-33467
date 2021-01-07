class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /^[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /^[ァ-ンー－]+$/, message: '全角カタカナを使用してください' } do
    validates :family_name_kana
    validates :first_name_kana
  end

  with_options presence: true, format: { with: /^[a-zA-Z0-9]+$/, message: '半角英数字を使用してください' } do
    validates :encrypted_password, confirmation: true
  end

  validates :birth_day, presence: true
  validates :nick_name, presence: true
end
