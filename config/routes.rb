Rails.application.routes.draw do

  # ルートパスの設定（/へのgetリクエストでhomesコントローラのtopアクションを呼び出す設定
  root 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books
end
