class ApplicationController < ActionController::Base
  # アプリ選択ページ
  def app_selector
    @apps = [
      {
        name: 'Oracle Me',
        path: '/oracle-me',
        description: 'オラクルカードアプリ',
        icon: '🔮'
      },
      {
        name: 'Aroma',
        path: '/aroma',
        description: 'アロマアプリ',
        icon: '🌸'
      },
      {
        name: 'App 3',
        path: '/app3',
        description: '新しいアプリ',
        icon: '✨'
      }
    ]
  end
  
  # 動的アプリルーティング
  def dynamic_app
    @app_name = params[:app_name]
    # アプリ名に基づいて適切なビューを表示
    case @app_name
    when 'oracle-me'
      redirect_to oracle_cards_path
    when 'aroma'
      redirect_to aroma_cards_path
    when 'app3'
      redirect_to app3_cards_path
    else
      render 'application/app_not_found'
    end
  end
  
  def dynamic_app_show
    @app_name = params[:app_name]
    @id = params[:id]
    # アプリ名に基づいて適切なアクションを実行
    case @app_name
    when 'oracle-me'
      redirect_to oracle_card_path(@id)
    when 'aroma'
      redirect_to aroma_card_path(@id)
    when 'app3'
      redirect_to app3_card_path(@id)
    else
      render 'application/app_not_found'
    end
  end
end
