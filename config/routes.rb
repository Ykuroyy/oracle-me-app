Rails.application.routes.draw do
  # トップページをオラクルカードの一覧画面に設定
  root "oracle_cards#index"
  
  # オラクルカードのルーティング
  resources :oracle_cards, only: [:index, :show] do
    member do
      get :select
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
