Rails.application.routes.draw do
  # アプリ選択ページ
  root 'application#app_selector'
  
  # Oracle Me App
  scope '/oracle-me' do
    resources :oracle_cards, only: [:index, :show]
  end
  
  # Aroma App
  scope '/aroma' do
    resources :aroma_cards, only: [:index, :show]
  end
  
  # 新しいアプリ用のプレースホルダー
  scope '/app3' do
    resources :app3_cards, only: [:index, :show]
  end
  
  # 動的アプリルーティング（将来の拡張用）
  scope '/:app_name' do
    get '/', to: 'application#dynamic_app'
    get '/:id', to: 'application#dynamic_app_show'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
