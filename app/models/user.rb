class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname ,presence: true
  validates :first_name ,presence: true
  validates :last_name ,presence: true
  validates :first_name_kana ,presence: true
  validates :last_name_kana ,presence: true
  validates :birthday ,presence: true
  has_one :address
  include JpPrefecture
  jp_prefecture :prefecture_id

   def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_id).try(:name)
  end
    
  def prefecture_name=(prefecture_name)
    self.prefecture_id = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
