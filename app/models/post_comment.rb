class PostComment < ApplicationRecord
  #PostCommentモデルに対して、Userモデルとの関係性を追加
  belongs_to :user
  #PostCommentモデルに対して、PostImageモデルとの関係性を追加
  belongs_to :post_image
end
