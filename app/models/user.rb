class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  with_options presence: true do
  validates :nickname
  validates :surname, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :kana_name, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :kana_surname, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birthday
  end     
  validates :password,format:{with: /(?=.*?[a-z])(?=.*?\d)[a-z\d]/}
end
