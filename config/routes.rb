Rails.application.routes.draw do
  # ルートをOracle Meにリダイレクト
  root 'oracle_cards#index'
  
  # Oracle Me App
  scope '/oracle-me' do
    resources :oracle_cards, only: [:index, :show]
    get '/', to: 'oracle_cards#index'
  end
  
  # 動的アプリルーティング（将来の拡張用）- 最後に配置
  get '/:app_name', to: 'application#dynamic_app', constraints: ->(req) { !req.path.start_with?('/oracle-me') }
  get '/:app_name/:id', to: 'application#dynamic_app_show', constraints: ->(req) { !req.path.start_with?('/oracle-me') }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Custom health check endpoint
  get "health" => "application#health"

  # Defines the root path route ("/")
  # root "posts#index"
end
