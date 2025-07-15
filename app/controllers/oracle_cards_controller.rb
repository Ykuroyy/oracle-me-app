class OracleCardsController < ApplicationController
  def index
    # 34枚のカードをランダムに並べる
    @cards = (0..33).to_a.shuffle
  end

  def show
    # 選択されたカードの詳細を表示
    @card_number = params[:id].to_i
    
    # 有効なカード番号かチェック
    unless (0..33).include?(@card_number)
      redirect_to oracle_cards_path, alert: "無効なカード番号です"
      return
    end
    
    @oracle_card = OracleCard.find_by(number: @card_number)
    
    # カードが存在しない場合は、データベースを再シードしてから再試行
    unless @oracle_card
      Rails.logger.warn "カード #{@card_number} が見つかりません。データベースを再シードします。"
      
      # データベースを再シード
      begin
        Rails.application.load_seed
        @oracle_card = OracleCard.find_by(number: @card_number)
      rescue => e
        Rails.logger.error "データベース再シードエラー: #{e.message}"
      end
      
      # それでも見つからない場合は、デフォルトのカードを表示
    unless @oracle_card
      @oracle_card = OracleCard.new(
        number: @card_number,
          title: "神秘のカード",
          description: "✨ 宇宙からの特別なメッセージ ✨",
        message: "あなたの直感を信じてください。今日は素晴らしい日になるでしょう。"
      )
      end
    end
  end

  def select
    # ランダムにカードを選択
    @card_number = rand(34)
    redirect_to oracle_card_path(@card_number)
  end
end
