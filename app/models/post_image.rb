class PostImage < ApplicationRecord

  #PostImageモデルに対して、Userモデルとの関係性を追加
  belongs_to :user
  attachment :image
  
  #PostCommentモデルに対して、PostImageモデルが１：Nになるよう関連づけ
  has_many :post_comments, dependent: :destroy
  
end
