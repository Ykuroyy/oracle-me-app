class ApplicationController < ActionController::Base
  # ヘルスチェック用エンドポイント
  def health
    render json: { status: 'ok', timestamp: Time.current }, status: :ok
  end
  # アプリ選択ページ
  def app_selector
    @apps = [
      {
        name: 'Oracle Me',
        path: '/oracle-me',
        description: 'オラクルカードアプリ',
        icon: '🔮'
      }
    ]
  end
  
  # 動的アプリルーティング
  def dynamic_app
    @app_name = params[:app_name]
    # アプリ名に基づいて適切なビューを表示
    case @app_name
    when 'oracle-me'
      redirect_to '/oracle-me'
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
      redirect_to "/oracle-me/oracle_cards/#{@id}"
    else
      render 'application/app_not_found'
    end
  end
end
