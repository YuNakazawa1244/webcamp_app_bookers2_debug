Rails.application.routes.draw do

  #以下デバッグ、記載順の入れ替え

  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books

  # resources :users,only: [:show,:index,:edit,:update]
  # resources :books
  # devise_for :users
  # root 'homes#top'
  # get 'home/about' => 'homes#about'
  # 以上デバッグ、要質問

# 以下デバッグ、end追加
end
# デバッグ以上