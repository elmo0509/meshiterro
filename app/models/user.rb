class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Userモデルに対して、PostImageモデルが１：Nになるように関連づけ
  has_many :post_images, dependent: :destroy

  # Userモデルに対して、PostCommentモデルが１：Nになるように関連づけ
  has_many :post_comments, dependent: :destroy
  
  # Userモデルに対して、Favoriteモデルが１：Nになるように関連づけ
  has_many :favorites, dependent: :destroy
  attachment :profile_image
  
end
