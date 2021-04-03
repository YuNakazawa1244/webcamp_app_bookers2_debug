class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# 以下デバッグ問９訂正
  has_many :books,dependent: :destroy
  # belongs_to :books
# 以上デバッグ
  attachment :profile_image, destroy: false

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  # 以下デバッグ問２４
  validates :introduction, length: {maximum: 50}
  # 以上デバッグ

end
