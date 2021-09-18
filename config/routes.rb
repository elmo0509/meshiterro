Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  # resourcesメソッドは、ルーティングの一括自動生成
  # onlyオプションは、生成するルーティングを限定するオプション
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    # コメントは、登校画像に対してコメントされる。
    # post_commentsは、post_imagesに結びつく
    resource :favorites, only: [:create, :destroy]
    resources:post_comments, only: [:create, :destroy]
  end

end
