class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
  validates :nickname
  with_options format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/} do
  validates :surname 
  validates :name 
  end
  with_options format: {with: /\A[ァ-ヶー－]+\z/} do
  validates :kana_name
  validates :kana_surname
  end
  validates :birthday
  end     
  validates :password, length: { minimum: 6},format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

  has_many :items
  has_many :item_buys
end

 