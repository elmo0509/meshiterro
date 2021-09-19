class PostImage < ApplicationRecord

  #PostImageモデルに対して、Userモデルとの関係性を追加
  belongs_to :user
  attachment :image

  #PostImageモデルに対して、PostCommentモデルが１：Nになるよう関連づけ
  has_many :post_comments, dependent: :destroy

  # PostImageモデルに対して、Favoriteモデルが１：Nになるように関連づけ
  has_many :favorites, dependent: :destroy
  
  # バリデーション設定
  validates :shop_name, presence: true
  validates :image, presence: true

  # 引数で渡されたユーザidがFavoritesテーブル内に存在するかどうか
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
