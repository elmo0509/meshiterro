class PostImage < ApplicationRecord

  #PostImageモデルに対して、Userモデルとの関係性を追加
  belongs_to :user
  attachment :image
  
end
