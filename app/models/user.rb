class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true      
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて,設定してください'         
  
  with_options presence: true do
    validates :last_name_kanji, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/}
    validates :first_name_kanji, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/}
    validates :last_name_kana,format: { with: /\A([ァ-ン]|ー)+\z/}
    validates :first_name_kana,format: { with: /\A([ァ-ン]|ー)+\z/}
  end
              
  validates :birthday,
             presence: true

  has_many :products
  has_many :buys
 
end
